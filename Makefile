IMAGE := bbva2pandas
DIR    ?= $${PWD}
FORMAT ?= csv
OUTPUT ?= movements

.PHONY: help build run test

help:
	@echo "Usage: make <target> [VAR=value ...]"
	@echo ""
	@echo "Targets:"
	@echo "  build              Build the Docker image"
	@echo "  test               Run tests inside Docker (builds if needed)"
	@echo "  run [VAR=<val>...] Run bbva2pandas (see variables below)"
	@echo ""
	@echo "Variables for run:"
	@echo "  DIR=<path>         Directory with PDFs (default: current dir)"
	@echo "  FORMAT={csv,sqlite} Output format (default: csv)"
	@echo "  OUTPUT=<name>      Output filename without extension (default: movements)"
	@echo ""
	@echo "Examples:"
	@echo "  make run DIR=reports FORMAT=sqlite OUTPUT=bbva"

build:
	docker build -t $(IMAGE) .

test: build
	docker run --rm --entrypoint python $(IMAGE) -m unittest discover -s /app/tests -v

run: build
	docker run --rm -v "$(abspath $(DIR)):/data" $(IMAGE) /data $(FORMAT) --output_filename /data/$(OUTPUT)
