$jobname = "thesis";
$out_dir = "build";
$pdf_mode = 1;

# Enable shell escape for minted package
$pdflatex = "pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error %O %S";

# Use biber for bibliography processing
$biber = "biber --output-directory=$out_dir %O %S";
$bibtex_use = 2;

# Clean up auxiliary files
$clean_ext = "aux bbl bcf blg fdb_latexmk fls log out run.xml synctex.gz toc lof lot";

IMAGE_NAME = thesis-latex
CONTAINER_WORKDIR = /workspace

.PHONY: build clean docker-build watch help

# Default target
all: build

# Show available commands
help:
	@echo "Available targets:"
	@echo "  build        - Build the PDF using Docker"
	@echo "  clean        - Remove auxiliary build files"
	@echo "  distclean    - Remove all build files including PDF"
	@echo "  docker-build - Build the Docker image"
	@echo "  watch        - Watch for changes and rebuild automatically"

# Build the Docker image
docker-build:
	docker build -t $(IMAGE_NAME) .devcontainer/

# Build the PDF using Docker
build: docker-build
	docker run --rm \
		-v "$(PWD):$(CONTAINER_WORKDIR)" \
		-w $(CONTAINER_WORKDIR) \
		$(IMAGE_NAME) \
		latexmk -pdf -shell-escape -outdir=build main.tex

# Watch for changes and rebuild
watch: docker-build
	docker run --rm \
		-v "$(PWD):$(CONTAINER_WORKDIR)" \
		-w $(CONTAINER_WORKDIR) \
		$(IMAGE_NAME) \
		latexmk -pdf -shell-escape -outdir=build -pvc main.tex

# Clean build artifacts
clean:
	rm -rf build/*.aux build/*.log build/*.fls build/*.fdb_latexmk \
		build/*.synctex.gz build/*.out build/*.toc build/*.lof \
		build/*.lot build/*.bbl build/*.blg build/*.run.xml build/*.bcf \
		_minted-main/

# Full clean including PDF
distclean: clean
	rm -rf build/ _minted-/
