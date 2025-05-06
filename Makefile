.PHONY: build build-left build-right clean shell rebuild-container

# Default target
all: build

# Ensure the container is built first
container:
	@docker compose -f local-build/docker-compose.yml build

# Rebuild container without using cache
rebuild-container:
	@echo "Rebuilding Docker container with latest ZMK..."
	@docker compose -f local-build/docker-compose.yml build --no-cache zmk-build
	@echo "Container rebuilt successfully!"

# Build both halves
build: container
	@LOCAL_BUILD_DIR="$(shell pwd)/local-build" ./local-build/build.sh both

# Build just the left half
build-left: container
	@LOCAL_BUILD_DIR="$(shell pwd)/local-build" ./local-build/build.sh left

# Build just the right half
build-right: container
	@LOCAL_BUILD_DIR="$(shell pwd)/local-build" ./local-build/build.sh right

# Build with clean (pristine)
build-clean: container
	@LOCAL_BUILD_DIR="$(shell pwd)/local-build" ./local-build/build.sh --clean both

# Clean the build directory
clean:
	@rm -rf build

# Open a shell in the build container
shell: container
	@docker compose -f local-build/docker-compose.yml run --rm zmk-build bash

help:
	@echo "Available targets:"
	@echo "  build       - Build both halves of the keyboard"
	@echo "  build-left  - Build just the left half"
	@echo "  build-right - Build just the right half"
	@echo "  build-clean - Perform a clean build of both halves"
	@echo "  clean       - Clean the build directory"
	@echo "  shell       - Open a shell in the build container"
	@echo "  rebuild-container - Rebuild Docker container with latest ZMK" 