#!/bin/bash

# Parse command-line arguments
CLEAN_BUILD=false
BUILD_TARGET=""

# Get the directory where this script is located
if [ -z "$LOCAL_BUILD_DIR" ]; then
  LOCAL_BUILD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi
PROJECT_ROOT="$(cd "$LOCAL_BUILD_DIR/.." && pwd)"

# Create build directory if it doesn't exist
mkdir -p "$PROJECT_ROOT/build"

show_usage() {
  echo "Usage: $0 [options] [left|right|both]"
  echo "Options:"
  echo "  -c, --clean     Perform a clean build (pristine)"
  echo "  -h, --help      Show this help message"
  echo ""
  echo "Target:"
  echo "  left            Build left half only"
  echo "  right           Build right half only"
  echo "  both            Build both halves (default)"
  exit 1
}

# Parse options
while [ "$#" -gt 0 ]; do
  case "$1" in
    -c|--clean) CLEAN_BUILD=true; shift 1;;
    -h|--help) show_usage;;
    left|right|both) BUILD_TARGET="$1"; shift 1;;
    *) echo "Unknown parameter: $1"; show_usage;;
  esac
done

# Set default target if not specified
if [ -z "$BUILD_TARGET" ]; then
  BUILD_TARGET="both"
fi

# Set pristine flag based on clean option
PRISTINE_FLAG=""
if [ "$CLEAN_BUILD" = true ]; then
  PRISTINE_FLAG="--pristine"
fi

echo "Building firmware for Totem keyboard ($BUILD_TARGET)..."

# Run the build command in Docker
if [ "$BUILD_TARGET" = "both" ] || [ "$BUILD_TARGET" = "left" ]; then
  echo "Building left half..."
  docker compose -f "$LOCAL_BUILD_DIR/docker-compose.yml" run --rm zmk-build bash -c \
    "cd /zmk-src/zmk/app && west build -d /workspace/build/left -b seeeduino_xiao_ble -- -DSHIELD=totem_left -DZMK_CONFIG=/workspace/config $PRISTINE_FLAG && cp /workspace/build/left/zephyr/zmk.uf2 /workspace/build/totem_left.uf2"
  
  if [ $? -ne 0 ]; then
    echo "Error building left half"
    exit 1
  fi
fi

if [ "$BUILD_TARGET" = "both" ] || [ "$BUILD_TARGET" = "right" ]; then
  echo "Building right half..."
  docker compose -f "$LOCAL_BUILD_DIR/docker-compose.yml" run --rm zmk-build bash -c \
    "cd /zmk-src/zmk/app && west build -d /workspace/build/right -b seeeduino_xiao_ble -- -DSHIELD=totem_right -DZMK_CONFIG=/workspace/config $PRISTINE_FLAG && cp /workspace/build/right/zephyr/zmk.uf2 /workspace/build/totem_right.uf2"
  
  if [ $? -ne 0 ]; then
    echo "Error building right half"
    exit 1
  fi
fi

echo "Build successful! Firmware files are in build/ directory:"
echo " - ${PROJECT_ROOT}/build/totem_left.uf2"
echo " - ${PROJECT_ROOT}/build/totem_right.uf2" 