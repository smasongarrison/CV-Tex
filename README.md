CV-Tex
======
This is my CV. You're probably looking for this link to the [PDF version](https://smasongarrison.github.io/CV-Tex/SMasonGarrisonCV.pdf).

[![buildpdf](https://github.com/smasongarrison/CV-Tex/actions/workflows/buildpdf.yml/badge.svg)](https://github.com/smasongarrison/CV-Tex/actions/workflows/buildpdf.yml)

## For Maintainers

This CV is built using LaTeX with a modular structure for easy updates. Content is organized into separate files in `Common/content/`.

### Quick Start

- **📝 Update content**: See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed instructions
- **📁 File organization**: Check [Common/content/README.md](Common/content/README.md) for structure
- **✅ Validate changes**: Run `bash validate_cv.sh` before committing
- **🔄 Auto-build**: PDF is automatically compiled on every `.tex` file change via GitHub Actions

### Common Tasks

- **Add a publication**: Edit `Common/content/research_publications.tex`
- **Update position**: Edit `Common/content/positions.tex`
- **Add presentation**: Edit `Common/content/research_presentations.tex`

For complete documentation, see [CONTRIBUTING.md](CONTRIBUTING.md).
