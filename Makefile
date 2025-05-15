.PHONY: docker-build build shell build-left build-right docker-rebuild

IMAGE_NAME := zmk-config-totem:local
DOCKERFILE := local-build/Dockerfile
WORKDIR := /app
BOARD ?= seeeduino_xiao_ble

# Build the Docker image

docker-build:
	docker build -f $(DOCKERFILE) -t $(IMAGE_NAME) .

docker-rebuild:
	docker build --no-cache -f $(DOCKERFILE) -t $(IMAGE_NAME) .

# Run a west build inside the container for a specific shield
# Usage: make build-shield BOARD=seeeduino_xiao_ble SHIELD=totem_left

build-shield:
	docker run --rm \
	  -v $$(pwd)/firmware:$(WORKDIR)/firmware\
	  -v $$(pwd)/config:$(WORKDIR)/config \
	  --workdir $(WORKDIR) $(IMAGE_NAME) \
	  /bin/bash -c "west build -s zmk/app -d build/$(BOARD)-$(SHIELD) -b $(BOARD) -- -DZMK_CONFIG=$(WORKDIR)/config -DSHIELD=$(SHIELD) && \
	  mkdir -p firmware && \
	  cp build/$(BOARD)-$(SHIELD)/zephyr/zmk.uf2 firmware/$(BOARD)-$(SHIELD).uf2"

# Build left half only
build-left:
	$(MAKE) build-shield BOARD=$(BOARD) SHIELD=totem_left

# Build right half only
build-right:
	$(MAKE) build-shield BOARD=$(BOARD) SHIELD=totem_right

# Build both halves (default build target)
build:
	$(MAKE) build-left
	$(MAKE) build-right

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
	@echo "  build           - Build firmware for both left and right halves (recommended)"
	@echo "  build-left      - Build firmware for left half only"
	@echo "  build-right     - Build firmware for right half only"
	@echo "  build-shield    - Build the firmware for a specific board and shield"
	@echo "                    Usage: make build-shield BOARD=seeeduino_xiao_ble SHIELD=totem_left"
	@echo "  shell           - Open a shell inside the container for manual commands"
	@echo ""
	@echo "Output firmware will be in the ./firmware directory" 