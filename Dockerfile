# Dockerfile for image to build stuff for Raspberry Pi

FROM balenalib/raspberry-pi-debian:latest
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Rapbian Buster (belenaOS) container with libraspberrypi-dev and build-essential."

RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential libraspberrypi-dev && \
    apt clean

ENTRYPOINT [ "/bin/bash" ]

# end