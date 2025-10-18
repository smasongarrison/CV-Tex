# Copilot Instructions for CV-Tex

## Repository Overview
This repository contains a LaTeX-based CV (Curriculum Vitae) for S. Mason Garrison. The CV is automatically compiled to PDF using GitHub Actions whenever `.tex` files are modified.

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

### Common Tasks
1. **Adding a new publication**: Edit `Common/content/research_publications.tex`
2. **Updating position/appointment**: Edit `Common/content/Positions.tex`
3. **Adding a presentation**: Edit `Common/content/research_presentations.tex`
4. **Modifying education**: Edit `Common/content/education.tex`

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
