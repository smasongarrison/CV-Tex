#!/bin/bash
# CV-Tex Validation Script
# This script checks for common issues in the CV LaTeX files

set -e

echo "==================================="
echo "CV-Tex Validation Script"
echo "==================================="
echo ""

ERRORS=0
WARNINGS=0

# Color codes for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "SMasonGarrisonCV.tex" ]; then
    echo -e "${RED}ERROR: SMasonGarrisonCV.tex not found. Please run this script from the repository root.${NC}"
    exit 1
fi

echo "1. Checking for case sensitivity issues in \\input{} statements..."
while IFS= read -r line; do
    # Extract filename from \input{} statement
    if [[ $line =~ \\input\{([^}]+)\} ]]; then
        input_file="${BASH_REMATCH[1]}"
        if [ ! -f "$input_file" ]; then
            echo -e "${RED}ERROR: Referenced file not found: $input_file${NC}"
            ERRORS=$((ERRORS + 1))
            
            # Try to find case-insensitive match
            dir=$(dirname "$input_file")
            base=$(basename "$input_file")
            if [ -d "$dir" ]; then
                match=$(find "$dir" -maxdepth 1 -iname "$base" 2>/dev/null | head -1)
                if [ -n "$match" ]; then
                    echo -e "${YELLOW}  SUGGESTION: Did you mean '$match'?${NC}"
                fi
            fi
        fi
    fi
done < "SMasonGarrisonCV.tex"

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ All \\input{} references are valid${NC}"
fi
echo ""

echo "2. Checking for unmatched LaTeX braces in main file..."
# This is a simple check - not perfect but catches obvious issues
if grep -Pzo '\{[^}]*$' SMasonGarrisonCV.tex >/dev/null 2>&1; then
    echo -e "${YELLOW}WARNING: Possible unmatched braces detected (manual review recommended)${NC}"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓ No obvious brace mismatches found${NC}"
fi
echo ""

echo "3. Checking for unmatched begin/end environments..."
# Count only non-commented \begin and \end (lines not starting with %)
begin_count=$(grep '\\begin{' SMasonGarrisonCV.tex | grep -v '^%' | wc -l)
end_count=$(grep '\\end{' SMasonGarrisonCV.tex | grep -v '^%' | wc -l)
# Note: This is a basic check that doesn't exclude environments inside \begin{comment} blocks
# It may report false warnings if commented code contains unbalanced environments
if [ "$begin_count" -ne "$end_count" ]; then
    echo -e "${YELLOW}WARNING: Potential mismatch between \\begin{} ($begin_count) and \\end{} ($end_count) statements${NC}"
    echo -e "${YELLOW}  Note: This count includes environments in \\begin{comment} blocks${NC}"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓ Begin/end environments appear balanced${NC}"
fi
echo ""

echo "4. Checking file naming conventions..."
# Check for uppercase in content filenames
uppercase_files=$(find Common/content -maxdepth 1 -name "*.tex" -exec basename {} \; | grep '[A-Z]' || true)
if [ -n "$uppercase_files" ]; then
    echo -e "${YELLOW}WARNING: Found files with uppercase letters (convention: use lowercase):${NC}"
    echo "$uppercase_files" | while read -r file; do
        echo "  - Common/content/$file"
    done
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓ All content files follow lowercase naming convention${NC}"
fi
echo ""

echo "5. Checking for common LaTeX special character issues..."
# Check for unescaped special characters in content files (basic check)
# Note: This is a basic pattern that may produce false positives
# It checks for $, #, & that aren't preceded by backslash
unescaped=$(grep -rn '[^\\][$#&]' Common/content/*.tex 2>/dev/null | grep -v '^Binary' | head -5 || true)
if [ -n "$unescaped" ]; then
    echo -e "${YELLOW}WARNING: Possible unescaped special characters found (first 5):${NC}"
    echo "$unescaped"
    WARNINGS=$((WARNINGS + 1))
else
    echo -e "${GREEN}✓ No obvious unescaped special characters found${NC}"
fi
echo ""

echo "6. Checking for proper section headers in content files..."
files_without_headers=0
for file in Common/content/*.tex; do
    if [ -f "$file" ]; then
        # Check for comment lines with at least 3 dashes (e.g., %---, %------------)
        if ! grep -q '^%-\{3,\}' "$file"; then
            echo -e "${YELLOW}WARNING: Missing section header comment in $(basename "$file")${NC}"
            files_without_headers=$((files_without_headers + 1))
        fi
    fi
done
if [ $files_without_headers -eq 0 ]; then
    echo -e "${GREEN}✓ All content files have section headers${NC}"
else
    WARNINGS=$((WARNINGS + files_without_headers))
fi
echo ""

echo "7. Checking for broken hyperlinks format..."
# Basic check for malformed \href{} commands
# Note: This is a simple check that may not catch all malformed hrefs
broken_hrefs=$(grep -rn '\\href{[^}]*{[^}]*$' Common/content/*.tex 2>/dev/null || true)
if [ -n "$broken_hrefs" ]; then
    echo -e "${RED}ERROR: Possible malformed \\href{} commands:${NC}"
    echo "$broken_hrefs"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}✓ No obviously malformed hyperlinks detected${NC}"
fi
echo ""

echo "8. Checking for TODO/FIXME comments..."
todos=$(grep -rn "TODO\|FIXME\|XXX\|HACK" --include="*.tex" . 2>/dev/null || true)
if [ -n "$todos" ]; then
    echo -e "${YELLOW}INFO: Found TODO/FIXME comments:${NC}"
    echo "$todos"
    # Don't count as warning - just informational
else
    echo -e "${GREEN}✓ No TODO comments found${NC}"
fi
echo ""

echo "==================================="
echo "Validation Summary"
echo "==================================="
echo -e "Errors: ${RED}$ERRORS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}FAILED: Please fix the errors above before committing.${NC}"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}PASSED WITH WARNINGS: Review warnings above.${NC}"
    exit 0
else
    echo -e "${GREEN}PASSED: All checks completed successfully!${NC}"
    exit 0
fi
