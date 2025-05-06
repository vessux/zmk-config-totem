# Local Build Environment

This setup allows building ZMK firmware for the Totem keyboard locally using Docker, without installing any development tools on your host system.

## Prerequisites

- Docker Desktop for Mac
- Git

## Usage

### Building Firmware

```bash
# Build both halves
make build

# Build individual halves
make build-left
make build-right

# Clean build (rebuilds from scratch)
make build-clean
```

The built firmware files will be in the `build/` directory:
- `build/totem_left.uf2` - Left half firmware
- `build/totem_right.uf2` - Right half firmware

### Other Commands

```bash
# Clean the build directory
make clean

# Access the build container shell
make shell

# Show help
make help
```

## How It Works

This setup uses a custom Docker container that includes all the necessary ZMK build tools and dependencies. The build process:

1. Builds the Docker container if needed
2. Mounts your local config directory into the container
3. Runs the ZMK build process for your keyboard
4. Copies the resulting firmware files to your build directory

The firmware files can then be manually flashed to your keyboard halves.

## Directory Structure

The local build system files are organized as follows:

- `Makefile` - In the project root, provides convenient build commands
- `local-build/` - Contains all the Docker-related build files:
  - `Dockerfile` - Defines the build environment
  - `docker-compose.yml` - Docker configuration
  - `build.sh` - Build script

## Troubleshooting

If you encounter issues:

1. Check Docker is running correctly with `docker info`
2. Try a clean build with `make build-clean`
3. Run `make shell` to enter the container and debug the build environment
4. Check your config files for syntax errors

## Updating ZMK

To update to the latest ZMK version, you need to rebuild the Docker container:

```bash
make rebuild-container
```

Then rebuild your firmware as usual. 