.PHONY: docker-build build shell build-all docker-rebuild

IMAGE_NAME := zmk-config-totem:local
DOCKERFILE := local-build/Dockerfile
WORKDIR := /app
BOARD ?= seeeduino_xiao_ble
SHIELD ?= totem_left

# Build the Docker image

docker-build:
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) .

docker-rebuild:
	docker build --no-cache -f $(DOCKERFILE) -t $(IMAGE_NAME) .

# Run a west build inside the container
# Usage: make build BOARD=seeeduino_xiao_ble SHIELD=totem_left

build:
	docker run --rm \
	  -v $$(pwd)/firmware:$(WORKDIR)/firmware\
	  -v $$(pwd)/config:$(WORKDIR)/config \
	  --workdir $(WORKDIR) $(IMAGE_NAME) \
	  /bin/bash -c "west build -s zmk/app -d build/$(BOARD)-$(SHIELD) -b $(BOARD) -- -DZMK_CONFIG=$(WORKDIR)/config -DSHIELD=$(SHIELD) && \
	  mkdir -p firmware && \
	  cp build/$(BOARD)-$(SHIELD)/zephyr/zmk.uf2 firmware/$(BOARD)-$(SHIELD).uf2"

# Build both halves

build-all:
	$(MAKE) build BOARD=$(BOARD) SHIELD=totem_left
	$(MAKE) build BOARD=$(BOARD) SHIELD=totem_right

# Open a shell inside the container for manual west commands

shell:
	docker run --rm -it \
	  -v $$(pwd)/config:$(WORKDIR)/config \
	  -v $$(pwd)/firmware:$(WORKDIR)/firmware \
	  --workdir $(WORKDIR) $(IMAGE_NAME) /bin/bash

help:
	@echo "Available targets:"
	@echo "  docker-build    - Build the Docker image"
	@echo "  docker-rebuild  - Rebuild the Docker image from scratch (no cache)"
	@echo "  build           - Build the firmware for a specific board and shield"
	@echo "                    Usage: make build BOARD=seeeduino_xiao_ble SHIELD=totem_left"
	@echo "  build-all       - Build firmware for both left and right halves"
	@echo "  shell           - Open a shell inside the container for manual commands"
	@echo ""
	@echo "Output firmware will be in the ./firmware directory" 