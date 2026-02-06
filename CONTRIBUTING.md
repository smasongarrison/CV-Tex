# Contributing to CV-Tex

This guide explains how to update and maintain the CV-Tex repository.

## Overview

This repository contains a LaTeX-based CV that is automatically compiled to PDF using GitHub Actions. The CV is modular, with content organized into separate files for easy maintenance.

## Repository Structure

```
CV-Tex/
├── SMasonGarrisonCV.tex          # Main CV document
├── SMasonGarrisonCV.pdf          # Generated PDF (auto-committed by GitHub Actions)
├── Common/
│   ├── content/                  # Content files for each CV section
│   │   ├── positions.tex
│   │   ├── education.tex
│   │   ├── research_publications.tex
│   │   └── ...
│   └── style/
│       └── MasonCV.sty           # Custom LaTeX style definitions
├── .github/
│   └── workflows/
│       └── buildpdf.yml          # GitHub Actions workflow
└── README.md
```

## How to Update Content

### Adding Publications

1. Open `Common/content/research_publications.tex`
2. Add new publications at the **top** of the `\begin{etaremune}` list (most recent first)
3. Follow the existing format:
   ```latex
   \item Author(s). (Year). Title. \textit{Journal}, volume(issue), pages.
   ```
4. Use the custom commands defined in `MasonCV.sty`:
   - `\meb` for the CV owner's name (appears bold)
   - `\noteA` or `\ssstar` for undergraduate co-authors
   - `\noteBalt` or `\ssdag` for graduate co-authors
   - `\bluelink{url}{text}` for hyperlinks

### Adding a Position

1. Open `Common/content/positions.tex`
2. Add the new position following the existing format:
   ```latex
   {\bf Institution Name}\\
   Title of Position\hfill{Start Date – End Date}
   ```

### Adding Presentations

1. Open `Common/content/research_presentations.tex`
2. Add presentations in reverse chronological order
3. Use consistent formatting with other entries

### Adding a New Section

1. Create a new `.tex` file in `Common/content/` (e.g., `new_section.tex`)
2. Start with a section header comment:
   ```latex
   %----------------------------------------------------------------------------------------
   %	Section Title
   %----------------------------------------------------------------------------------------
   ```
3. Wrap content in an `rSection` environment:
   ```latex
   \begin{rSection}{\textrm{Section Title}}
   Your content here
   \end{rSection}
   ```
4. Add the section to `SMasonGarrisonCV.tex`:
   ```latex
   \input{Common/content/new_section.tex}
   ```

## Important Conventions

### File Naming
- Use **lowercase** with underscores for all content files (e.g., `research_publications.tex`, not `Research_Publications.tex`)
- Keep filenames descriptive and consistent with section names

### LaTeX Formatting
- Use `\textrm{}` for section titles to ensure proper font rendering
- Use `\begin{etaremune}...\end{etaremune}` for reverse-numbered lists (publications, presentations)
- Use `\hfill{}` to right-align dates
- Maintain consistent spacing with `\medskip`, `\smallskip`, etc.

### Comments
- Add comment headers to separate major sections
- Use inline comments to explain non-obvious LaTeX commands
- Keep comments concise and helpful

## Build Process

### Automatic Builds
The GitHub Actions workflow automatically:
1. Triggers on any `.tex` file changes
2. Compiles `SMasonGarrisonCV.tex` using `pdflatex`
3. Uploads the generated PDF as an artifact
4. Commits the PDF back to the repository

### Local Testing
If you have LaTeX installed locally:
```bash
pdflatex SMasonGarrisonCV.tex
```

To test without local LaTeX:
1. Push changes to any branch
2. Check the Actions tab for build status
3. Download the generated PDF from the workflow artifacts

## Common LaTeX Patterns

### Hyperlinks
```latex
\href{url}{display text}
\bluelink{url}{display text}  % Custom blue hyperlink
```

### Bold Institution/Company Names
```latex
{\bf Institution Name}\\
```

### Indented Sub-entries
```latex
\hspace*{\pindent}Additional detail or subtitle\\
```

### Reverse-Numbered Lists
```latex
\begin{etaremune}
\item Most recent item (will be numbered highest)
\item Older item
\item Oldest item (will be numbered 1)
\end{etaremune}
```

### Student Co-author Notations
```latex
Student, A.\noteAalt  % Undergraduate (*)
Student, B.$\dagger$  % Graduate (†)
```

## Troubleshooting

### PDF Not Updating
- Verify your changes modified a `.tex` file
- Check the Actions tab for workflow status and error logs
- Ensure LaTeX syntax is valid (no unmatched braces, etc.)

### Compilation Errors
Common issues:
- **Unmatched braces**: Every `{` needs a closing `}`
- **Missing `\end{}`**: Every `\begin{environment}` needs `\end{environment}`
- **Special characters**: Escape `&`, `%`, `$`, `#`, `_` with backslash
- **Case sensitivity**: File references in `\input{}` are case-sensitive

### File Not Found Errors
- Verify the file path in `\input{}` exactly matches the actual filename
- Check for case mismatches (e.g., `Positions.tex` vs `positions.tex`)
- Ensure the file is in the correct directory

## Best Practices

1. **Make Small, Focused Changes**: Update one section at a time
2. **Test After Each Change**: Push to any branch to trigger automatic build
3. **Use Descriptive Commit Messages**: Explain what content was updated
4. **Keep Content Current**: Remove outdated positions, update dates
5. **Maintain Consistency**: Follow existing formatting patterns
6. **Use Custom Commands**: Leverage the commands in `MasonCV.sty` for consistency
7. **Check Generated PDF**: Always review the compiled PDF to ensure formatting is correct

## Custom Style Commands

The `Common/style/MasonCV.sty` file defines useful commands:

| Command | Purpose | Example |
|---------|---------|---------|
| `\meb` | Bold name of CV owner | `\meb` |
| `\Joe` | Collaborator name | `\Joe` |
| `\noteA` | Mark undergraduate co-author | `Student\noteAalt` |
| `\noteB` | Mark graduate co-author | `Student\noteBalt` |
| `\bluelink{url}{text}` | Blue hyperlink | `\bluelink{https://...}{doi:...}` |
| `\pindent` | Standard paragraph indent | `\hspace*{\pindent}` |

## Need Help?

- Check existing content files for examples
- Review the [LaTeX documentation](https://www.latex-project.org/help/documentation/)
- Open an issue if you encounter problems

## Quality Checklist

Before committing changes:
- [ ] LaTeX syntax is valid (matching braces, environments)
- [ ] File references use correct case
- [ ] Formatting is consistent with existing content
- [ ] Dates are current and accurate
- [ ] Hyperlinks are functional
- [ ] Special characters are properly escaped
- [ ] Content is in reverse chronological order (where applicable)
- [ ] Comments are clear and helpful
