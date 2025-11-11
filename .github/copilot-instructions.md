# Copilot Instructions for CV-Tex

## Repository Overview
This repository contains a LaTeX-based CV (Curriculum Vitae) for S. Mason Garrison. The CV is automatically compiled to PDF using GitHub Actions whenever `.tex` files are modified.

### Primary Goals
- Maintain a professional, well-formatted academic CV
- Keep content current and accurate
- Ensure automatic PDF generation works reliably
- Preserve modular structure for easy content updates

### Key Constraints
- Changes must compile successfully with `pdflatex`
- Preserve existing formatting and style conventions
- Maintain compatibility with GitHub Actions LaTeX environment
- Keep the PDF output professional and print-ready

## Project Structure
- **SMasonGarrisonCV.tex**: Main CV document that includes all sections
- **Common/content/**: Directory containing individual content files for each CV section (positions, education, publications, etc.)
- **Common/style/**: LaTeX style files and formatting
- **SMasonGarrisonCV.pdf**: Generated PDF output (auto-committed by GitHub Actions)
- **.github/workflows/buildpdf.yml**: GitHub Actions workflow for automatic PDF compilation

## Key Technologies
- **LaTeX**: Document preparation system (document class: article, paper size: letterpaper)
- **GitHub Actions**: Automated PDF compilation using `xu-cheng/latex-action@v4`
- **Version Control**: Git for tracking changes to CV content

## Build Process
1. Changes to any `.tex` file trigger the GitHub Actions workflow
2. The workflow compiles `SMasonGarrisonCV.tex` using LaTeX
3. The generated PDF is uploaded as an artifact and committed back to the repository
4. The PDF is available at: https://smasongarrison.github.io/CV-Tex/SMasonGarrisonCV.pdf

## Guidelines for Changes

### Content Updates
- Most content changes should be made in the individual files under `Common/content/`
- The main CV file (`SMasonGarrisonCV.tex`) primarily contains `\input{}` statements to include content sections
- Maintain consistent formatting across all content files
- Use reverse chronological order for listings (most recent first)

### LaTeX Formatting
- The custom style package `Common/style/MasonCV` defines the CV formatting
- Use `\begin{rSection}{Section Title}` for major sections
- Use `\begin{etaremune}` for reverse-numbered lists
- Hyperlinks use the `\href{}` command from the hyperref package

### Testing Changes
- LaTeX changes can be tested locally if you have a LaTeX distribution installed
- Compile with: `pdflatex SMasonGarrisonCV.tex`
- GitHub Actions will automatically compile and commit the PDF upon push to any branch

### Validation and Quality Checks
Before finalizing any changes:
1. **Syntax Check**: Ensure LaTeX compiles without errors
2. **Visual Review**: Check the generated PDF for formatting issues
3. **Link Verification**: Test that all hyperlinks work correctly
4. **Content Accuracy**: Verify dates, names, and details are correct
5. **Consistency**: Ensure new content matches existing style and formatting

### Common Tasks
1. **Adding a new publication**: 
   - Edit `Common/content/research_publications.tex`
   - Add to the top of the `\begin{etaremune}` list (most recent first)
   - Follow format: `\item Author(s). (Year). Title. \textit{Journal}, volume(issue), pages.`

2. **Updating position/appointment**: 
   - Edit `Common/content/positions.tex`
   - Use format: `{\bf Institution}\\` then `Title, Department \hfill{Date Range}`

3. **Adding a presentation**: 
   - Edit `Common/content/research_presentations.tex`
   - Maintain reverse chronological order

4. **Modifying education**: 
   - Edit `Common/content/education.tex`
   - Use `\hspace*{\pindent}` for indented sub-entries

5. **Adding a new section**:
   - Create new `.tex` file in `Common/content/`
   - Add `\input{Common/content/filename.tex}` to `SMasonGarrisonCV.tex`
   - Follow the `\begin{rSection}{Title}...\end{rSection}` pattern

### Best Practices
- Keep content files focused on a single topic area
- Maintain LaTeX syntax and formatting consistency
- Don't manually edit the generated PDF file
- Use semantic whitespace and comments for readability
- Test that the document compiles successfully before committing

### Workflow Considerations
- The PDF file is auto-generated and committed by GitHub Actions bot
- Changes to `.tex` files will trigger automatic builds
- Build status is shown by the badge in README.md
- The workflow has write permissions to commit the generated PDF

## File Encoding and Style
- Use UTF-8 encoding for all text files
- Follow existing LaTeX commenting style with `%` for comments
- Maintain existing indentation and spacing patterns in `.tex` files

## Development Environment Setup
- **Local Development**: Requires a LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- **Testing Locally**: Run `pdflatex SMasonGarrisonCV.tex` in the repository root
- **No Local Setup Required**: Changes can be tested via GitHub Actions by pushing to any branch
- The workflow automatically compiles and commits the PDF on every `.tex` file change

## Common LaTeX Patterns in This Repository

### Section Structure
```latex
\begin{rSection}{\textrm{Section Title}}
Content here
\end{rSection}
```

### Position/Appointment Entry
```latex
{\bf Institution Name}\\
Title, Department \hfill{Start Date – End Date}
```

### Education Entry with Indented Details
```latex
{\bf University Name}\\
Degree \hfill{Date}\\
\hspace*{\pindent}Additional detail or subtitle\\
```

### Hyperlinks
```latex
\href{url}{display text}
```

### Reverse-Numbered Lists (for publications)
```latex
\begin{etaremune}
\item Publication entry 1 (most recent)
\item Publication entry 2
\end{etaremune}
```

## What NOT to Do
- ❌ **Do NOT** manually edit `SMasonGarrisonCV.pdf` - it's auto-generated
- ❌ **Do NOT** commit temporary build files (`.aux`, `.log`, `.out` files)
- ❌ **Do NOT** change the document class or paper size without good reason
- ❌ **Do NOT** add new LaTeX packages without testing compilation
- ❌ **Do NOT** remove the `\input{}` structure - keep content modular
- ❌ **Do NOT** use absolute dates in content - use relative terms when appropriate
- ❌ **Do NOT** break existing hyperlinks in the PDF

## Troubleshooting

### Compilation Fails
- Check for unmatched braces `{}` or environments (`\begin{}` without `\end{}`)
- Verify all special LaTeX characters are properly escaped (`&`, `%`, `$`, `#`, `_`)
- Review the GitHub Actions workflow logs for specific error messages
- Ensure file names in `\input{}` commands match exactly (case-sensitive)

### PDF Not Updated After Push
- Verify the push modified a `.tex` file (workflow only triggers on `.tex` changes)
- Check the Actions tab for workflow status
- The workflow may take 1-2 minutes to complete

### Missing Content in PDF
- Ensure the content file is properly `\input{}` in the main CV file
- Check that the content file uses valid LaTeX syntax
- Verify file paths are correct relative to the main `.tex` file
