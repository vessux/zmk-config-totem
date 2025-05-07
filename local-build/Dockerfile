FROM zmkfirmware/zmk-build-arm:stable

WORKDIR /app
COPY ../config/west.yml config/west.yml

# Initialize and update west (fetches ZMK and modules)
RUN west init -l config && \
    west update && \
    west zephyr-export