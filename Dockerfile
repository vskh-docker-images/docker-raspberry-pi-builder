# Dockerfile for image to build stuff for Raspberry Pi

FROM debian:bookworm
LABEL org.opencontainers.image.authors="Vadym S. Khondar <vadym@khondar.name>"
LABEL org.opencontainers.image.description="Debian-based Raspberry Pi builder with build-essential and Raspberry Pi device-tree tools."
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg && \
    curl -fsSL https://archive.raspberrypi.com/debian/raspberrypi.gpg.key | \
    gpg --dearmor -o /usr/share/keyrings/raspberrypi-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/raspberrypi-archive-keyring.gpg] https://archive.raspberrypi.com/debian bookworm main" \
    > /etc/apt/sources.list.d/raspberrypi.list && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    raspi-utils-dt && \
    apt-get clean && \
    apt-get purge -y --auto-remove curl gnupg && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]

# end
