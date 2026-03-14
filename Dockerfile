# Dockerfile for image to build stuff for Raspberry Pi

FROM debian:bookworm-slim
ARG DEBIAN_FRONTEND=noninteractive
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Debian-based Raspberry Pi builder with build-essential and Raspberry Pi tools."

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        gnupg && \
    curl -fsSL https://archive.raspberrypi.com/debian/raspberrypi.gpg.key | \
        gpg --dearmor -o /usr/share/keyrings/raspberrypi-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/raspberrypi-archive-keyring.gpg] https://archive.raspberrypi.com/debian bookworm main" \
        > /etc/apt/sources.list.d/raspberrypi.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        raspi-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]

# end
