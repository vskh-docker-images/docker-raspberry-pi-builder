# Dockerfile for image to build stuff for Raspberry Pi

FROM vascoguita/raspios:armhf
LABEL "maintainer"="Vadym S. Khondar <vadym@khondar.name>"
LABEL "description"="Raspberry Pi OS container with libdtovl0 and build-essential."

RUN sed -i 's/^update_initramfs=.*/update_initramfs=no/' /etc/initramfs-tools/update-initramfs.conf && \
    rm -f /etc/kernel/postinst.d/initramfs-tools && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends build-essential libdtovl0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/bin/bash" ]

# end
