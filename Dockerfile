FROM --platform=linux/amd64 debian:bookworm-slim

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      nasm binutils gcc-multilib gdb make libc6-dev-i386 python3 qemu-user \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
CMD ["/bin/bash"]
