# LaTeX Development Container

This directory contains configuration files for a containerized LaTeX development environment using VS Code's Dev Containers feature.

Source: https://github.com/James-Yu/LaTeX-Workshop/wiki/Install#using-docker
NB! This implementation contains modifications

## Quick Start

### Prerequisites
- **VS Code** with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- **Docker** installed and running on your system

### Spinning Up the Container

1. Open the project folder in VS Code
2. A notification should appear suggesting "Reopen in Container" - click it
   - Alternatively, use the Command Palette (Cmd+Shift+P) and select "Dev Containers: Reopen in Container"
3. VS Code will build the Docker image and create a container (this may take a few minutes on first run)
4. Once complete, you'll be working inside the container with all LaTeX tools available

## What's Included

### Container Image
- **Base**: Ubuntu latest
- **LaTeX Distribution**: TeX Live with essential packages
- **Build Tools**: latexmk, biber, chktex
- **Language Support**: English packages
- **Python**: For Pygments syntax highlighting support
- **Perl Modules**: For latexindent support

### VS Code Extensions
- **LaTeX Workshop** (`james-yu.latex-workshop`) - Required for LaTeX editing and compilation
- **LTeX** (`valentjnl.vscode-ltex`) - Grammar and spell checking (recommended)

## Building Your Thesis

Once the container is running:

1. Ensure all chapter files are in the `Chapters/` directory
2. Ensure all figures are in the `Figures/` directory
3. Build the PDF using LaTeX Workshop:
   - Press `Cmd+Alt+B` (or use the command palette: "LaTeX Workshop: Build LaTeX project")
   - The PDF will be generated as `main.pdf`

## Project Structure

```
.devcontainer/
├── devcontainer.json       # Dev container configuration
├── Dockerfile              # Container image definition
├── extensions.json         # VS Code extensions (deprecated in newer versions)
└── README.md              # This file

Chapters/                   # LaTeX chapter files
Figures/                    # Figures and images
setup.tex                   # Preamble with all package imports and configuration
main.tex                    # Main document file
bibliography.bib           # BibTeX bibliography database
```

## Troubleshooting

**Container won't build**: Ensure Docker is running and you have sufficient disk space.

**PDFs not generating**: Check the LaTeX Workshop output panel (View → Output) for compilation errors.

**Extensions not installing**: The extensions will install automatically on first container startup, but you can manually reinstall via the Extensions panel.

## References

- [VS Code Dev Containers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [LaTeX Workshop Documentation](https://github.com/James-Yu/LaTeX-Workshop/wiki)
- [TeX Live Documentation](https://tug.org/texlive/)
