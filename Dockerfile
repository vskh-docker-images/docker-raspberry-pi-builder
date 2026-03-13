# Dockerfile for image to build stuff for Raspberry Pi

FROM vascoguita/raspios:armhf
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Raspberry Pi OS (Bookworm) container with libraspberrypi-dev and build-essential."

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends build-essential libraspberrypi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]

# end
