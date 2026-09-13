FROM --platform=linux/amd64 debian:bookworm-slim

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      nasm binutils gcc-multilib gdb make libc6-dev-i386 python3 qemu-user \
      ca-certificates curl ncurses-term xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -LsSf https://install.pwndbg.re \
    | sh -s -- -t pwndbg-gdb && \
    ln -s /usr/local/bin/pwndbg /usr/local/bin/gdb-pwndbg

WORKDIR /workspace
CMD ["/bin/bash"]
