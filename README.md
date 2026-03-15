# docker-raspberry-pi-builder

Debian-based Raspberry Pi builder image with updated packages, build-essential, and Raspberry Pi device-tree tools from the Raspberry Pi archive.

The image starts from the official `debian:bookworm-slim` base and adds the Raspberry Pi apt archive explicitly instead of inheriting an unofficial Raspberry Pi OS image. The container build still keeps package freshness by running `apt-get update` and `apt-get upgrade` during image creation.

Current image scope:

- Target platform: `linux/arm/v7`
- Base image: Debian Bookworm Slim
- Raspberry Pi-specific packages: `raspi-utils-dt`, `libdtovl0`
- Default shell entrypoint: `/bin/bash`

Example multistage build:

```dockerfile
FROM ghcr.io/<owner>/docker-raspberry-pi-builder:latest AS build
WORKDIR /src
COPY . .
RUN make

FROM debian:bookworm-slim
COPY --from=build /src/out/my-binary /usr/local/bin/my-binary
ENTRYPOINT ["/usr/local/bin/my-binary"]
```

The GitHub Actions workflow builds and publishes the image to GHCR, signs published images with cosign, and runs a pull request smoke test that checks `build-essential`, `raspi-utils-dt`, `libdtovl0`, and the presence of `dtoverlay`.
