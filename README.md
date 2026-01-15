# Master's Thesis LaTeX Template

[![PDF](https://img.shields.io/badge/PDF-latest-blue)](./build/main.pdf)

A professional LaTeX template for writing a master's thesis, originally created by Nina Salvesen for NTNU and modified by Torbjørn Wiik for B5 format with enhanced tooling.

## Features

- **Clean Structure**: Organized chapters, figures, and bibliography
- **Professional Styling**: Customizable chapter styles and headers
- **Cross-References**: cleveref support for intelligent cross-references
- **IEEE Citations**: Numeric citation style with biber backend
- **B5 Paper Format**: Compact size suitable for printing and distribution
- **Dev Containers**: Containerized TeX Live environment for consistency
- **Spell Checking**: Grammar and spell checking with LTeX (English US)
- **Automated Builds**: latexmk configuration for reliable PDF generation

## Quick Start

### Prerequisites

- **VS Code** with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- **Docker** installed and running

### Setup Instructions

1. Clone or fork this repository
2. Open the project folder in VS Code
3. VS Code will prompt "Reopen in Container" → click it
4. The container will build automatically (first time may take a few minutes)
5. Once complete, you're ready to edit and build

### Building the PDF

Inside the container:
- **Build**: Press `Cmd+Alt+B` or use Command Palette → "LaTeX Workshop: Build LaTeX project"
- **View**: The PDF generates to `build/main.pdf`
- **Auto-build**: Save changes to auto-compile (configurable)

See [`.devcontainer/README.md`](.devcontainer/README.md) for detailed container setup information.

## Project Structure

```
.
├── main.tex                 # Main document file
├── setup.tex               # Preamble with all packages and configuration
├── bibliography.bib        # BibTeX database
├── .latexmkrc             # latexmk build configuration
├── Chapters/              # Chapter files (00Abstract through 08Appendix)
├── Figures/               # Figures and images
├── .devcontainer/         # Dev Container configuration
│   ├── Dockerfile         # Container image definition
│   ├── devcontainer.json  # VS Code dev container config
│   └── README.md         # Container setup guide
└── .vscode/              # VS Code settings
    └── settings.json     # Editor configuration (LTeX, build settings)
```

## Customization

### Paper Size and Margins

Edit `setup.tex`:
```latex
\documentclass[b5paper, 12pt]{report}
\usepackage[lmargin=1.25in, rmargin=0.9in, tmargin=0.8in, bmargin=0.8in]{geometry}
```

### Bibliography Style

Edit `setup.tex` to change `style=ieee` to other styles (e.g., `alphabetic`, `authoryear`).

### Language and Spell Checking

Edit `.vscode/settings.json`:
```json
"ltex.language": "en-US",
"ltex.dictionary": { "en-US": ["custom", "words"] }
```

## Build Output

- **PDF**: `build/main.pdf`
- **Temporary Files**: Stored in `build/` directory (kept out of working directory)
- **Git**: Add `build/` to `.gitignore` (already configured)

## License

LaTeX Project Public License (LPPL) 1.3c.

## Attribution

- **Original Template**: Nina Salvesen (NTNU, 2022)
- **Modifications**: Torbjørn Wiik (2026)
  - B5 paper format
  - Dev Container setup
  - IEEE citation style
  - cleveref support
  - LTeX grammar checking

## Disclaimer

This is not an official NTNU template. It's a community template designed to simplify thesis writing. Feel free to modify it for your specific needs.

## References

- [LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)
- [TeX Live Documentation](https://tug.org/texlive/)
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [biblatex Documentation](http://mirrors.ctan.org/macros/latex/contrib/biblatex/doc/biblatex.pdf)
