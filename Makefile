IMAGE_NAME = thesis-latex
CONTAINER_WORKDIR = /workspace

.PHONY: build clean docker-build

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

# Clean build artifacts
clean:
	rm -rf build/*.aux build/*.log build/*.fls build/*.fdb_latexmk \
		build/*.synctex.gz build/*.out build/*.toc build/*.lof \
		build/*.lot build/*.bbl build/*.blg build/*.run.xml build/*.bcf

# Full clean including PDF
distclean: clean
	rm -rf build/
