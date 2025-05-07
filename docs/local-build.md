# Local Build Environment

This setup allows building ZMK firmware for the Totem keyboard locally using Docker, without installing any development tools on your host system.

## Prerequisites

- Docker Desktop for Mac/Windows/Linux
- Git

## Usage

### Building Firmware

```bash
# Build both halves
make build-all

# Build individual halves
make build BOARD=seeeduino_xiao_ble SHIELD=totem_left
make build BOARD=seeeduino_xiao_ble SHIELD=totem_right

# Rebuild the Docker image from scratch
make docker-rebuild
```

The built firmware files will be in the `firmware/` directory:
- `firmware/seeeduino_xiao_ble-totem_left.uf2` - Left half firmware
- `firmware/seeeduino_xiao_ble-totem_right.uf2` - Right half firmware

### Other Commands

```bash
# Build the Docker image
make docker-build

# Access the build container shell
make shell

# Show help
make help
```

## How It Works

This setup uses a custom Docker container that includes all the necessary ZMK build tools and dependencies. The build process:

1. Builds the Docker container if needed
2. Mounts your local `config/` and `firmware/` directories into the container
3. Runs the ZMK build process inside the container 
4. Creates the firmware directory if needed
5. Copies the resulting firmware files to your local `firmware/` directory

The firmware files can then be manually flashed to your keyboard halves.

### Important Note About ZMK Modules and Dependencies

The ZMK repository configuration file (`west.yml`) is baked into the Docker image during build time. This file defines:
- Which ZMK version to use
- Any additional modules and dependencies to include
- Repository sources and versions

If you modify the `west.yml` file to add new modules or change ZMK versions, you must rebuild the Docker image with:

```bash
make docker-rebuild
```

Simply rebuilding the firmware will not incorporate changes to module configurations or dependency updates.

## Directory Structure

The local build system files are organized as follows:

- `Makefile` - In the project root, provides convenient build commands
- `local-build/` - Contains all the Docker-related build files:
  - `Dockerfile` - Defines the build environment
- `config/` - Contains your ZMK configuration files
- `firmware/` - Output directory for built firmware files (ignored by git)

Note: Build artifacts remain inside the container and are not persisted to the host system.

## Troubleshooting

If you encounter issues:

1. Check Docker is running correctly with `docker info`
2. Try rebuilding the container with `make docker-rebuild`
3. Run `make shell` to enter the container and debug the build environment
4. Check your config files for syntax errors

## Updating ZMK

To update to the latest ZMK version, you need to rebuild the Docker container:

```bash
make docker-rebuild
```

Then rebuild your firmware as usual. 