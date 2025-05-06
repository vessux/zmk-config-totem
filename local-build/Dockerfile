FROM zmkfirmware/zmk-build-arm:stable

# Set up environment variables
ENV ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ENV ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk

# Create and set up working directory for ZMK
WORKDIR /zmk-src

# Clone and set up ZMK repository following an alternative approach
RUN git clone https://github.com/zmkfirmware/zmk.git /zmk-src/zmk && \
    cd /zmk-src/zmk && \
    git checkout main && \
    west init -l /zmk-src/zmk && \
    west update && \
    cd /zmk-src && \
    west zephyr-export && \
    pip install -r /zmk-src/zephyr/scripts/requirements-base.txt && \
    pip install wheel && \
    pip install -r /zmk-src/zmk/app/scripts/requirements.txt

# Set the final working directory to /workspace
# This will be where we mount the user config
WORKDIR /workspace 