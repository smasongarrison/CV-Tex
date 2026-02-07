# CV Content Files

This directory contains modular content files for each section of the CV. Each file is included in the main `SMasonGarrisonCV.tex` file using `\input{}` commands.

## File Organization

### Academic Positions & Education
- **positions.tex** - Current and past academic appointments
- **education.tex** - Degrees, certificates, and academic training

### Research Output
- **research_publications.tex** - Peer-reviewed publications (reverse chronological)
- **research_books.tex** - Books and book chapters
- **research_software.tex** - Software packages and tools
- **research_presentations.tex** - Conference presentations and invited talks
- **research_abstracts.tex** - Published abstracts

### Works in Progress
- **working_papers.tex** - Manuscripts under review or in preparation
- **working_grants.tex** - Grant proposals in progress
- **working_presentations.tex** - Upcoming presentations

### Funding & Recognition
- **funds.tex** - Awards, honors, and fellowships
- **grant.tex** - Funded grants and contracts

### Teaching & Experience
- **experience_teaching.tex** - Courses taught
- **experience_academic.tex** - Academic positions and roles
- **experience_fieldwork.tex** - Field research experience
- **experience_consulting.tex** - Consulting work

### Service & Leadership
- **service.tex** - Professional service activities
- **service_committees.tex** - Committee memberships and advising
- **service_outreach.tex** - Community outreach and engagement
- **administration.tex** - Administrative roles

### Professional Development
- **training_skills.tex** - Technical and professional skills
- **training_coursework.tex** - Relevant coursework
- **training_supplement.tex** - Additional training
- **training_development.tex** - Professional development activities

### Other
- **interests.tex** - Research interests and areas of expertise

## File Naming Conventions

All files follow these conventions:
- **Lowercase only** - Use lowercase letters for all filenames
- **Underscores for spaces** - Use `_` to separate words (e.g., `research_publications.tex`)
- **Descriptive names** - Filenames should clearly indicate content
- **`.tex` extension** - All files must have the `.tex` extension

## Adding New Content Files

1. Create the file with a descriptive, lowercase name
2. Add a header comment:
   ```latex
   %----------------------------------------------------------------------------------------
   %	Section Title
   %----------------------------------------------------------------------------------------
   ```
3. Include in main CV file: Add `\input{Common/content/filename.tex}` to `SMasonGarrisonCV.tex`

## Structure of Content Files

Most content files follow this structure:

```latex
%----------------------------------------------------------------------------------------
%	Section Title
%----------------------------------------------------------------------------------------
\begin{rSection}{\textrm{Section Title}}

Content goes here

\end{rSection}
```

For publications and presentations, use reverse-numbered lists:

```latex
\begin{rSection}{\textrm{Publications}}
\begin{etaremune}
\item Most recent publication (appears first, highest number)
\item Earlier publication
\item Oldest publication (numbered 1)
\end{etaremune}
\end{rSection}
```

## Common Patterns

### Position/Appointment Entry
```latex
{\bf Institution Name}\\
Title, Department \hfill{Start Date – End Date}
```

### Publication Entry
```latex
\item Author(s). (Year). Title. \textit{Journal}, volume(issue), pages. \bluelink{url}{doi:...}
```

### Education Entry
```latex
{\bf University Name}\\
Degree \hfill{Date}\\
\hspace*{\pindent}Additional details or subtitle
```

## Best Practices

1. **Keep entries current** - Update regularly with new content
2. **Maintain reverse chronological order** - Most recent items first
3. **Use consistent formatting** - Follow patterns from existing files
4. **Include comments** - Add explanatory comments for complex sections
5. **Test after changes** - Verify the CV compiles successfully

## Unused Sections

Some files may contain content wrapped in `\begin{comment}...\end{comment}` blocks. This allows you to:
- Temporarily hide content without deleting it
- Keep notes for future additions
- Maintain historical information

To re-enable commented content, remove the `\begin{comment}` and `\end{comment}` tags.

## Special Directory

### NOS/
Contains supplementary content files that may be used for specific CV versions or alternative formats. These are not included in the main CV by default.
