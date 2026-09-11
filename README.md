# x86 32-bit Assembly Practice on Apple Silicon

This self-contained course teaches Linux x86 assembly and the reverse-engineering skills used in Georgia Tech CS6265. Code runs in an amd64 Debian container, so your Mac stays clean. The container invokes `qemu-i386` for ELF32 exercises because Rosetta translates x86-64 Linux code, not 32-bit x86 code.

## Prerequisites

1. Install Docker Desktop for Mac.
2. On Apple Silicon, open Docker Desktop **Settings > General** and enable **Use Rosetta for x86/amd64 emulation**.
3. Start Docker Desktop, then run:

```sh
chmod +x setup.sh progress.sh src/*/test.sh tests/run-all.sh
./setup.sh
```

## Daily workflow

```sh
make run MODULE=00-hello
make test-module MODULE=00-hello
make test
make shell
```

Edit `starter.asm`; tests deliberately test the starter so you learn by completing it. Compare with `solution.asm` when stuck. Each module README includes its objective and exercise.

To record work:

```sh
./progress.sh 00 complete 1 "Hello syscall works"
```

## Tooling inside the container

Assemble with `nasm -f elf32`, link with `ld -m elf_i386`, inspect with `objdump -d -M intel`, and debug with `gdb`. Module 18 uses ELF64 intentionally.

## Troubleshooting

- `exec format error`: rebuild the image so `qemu-i386` is installed, and run exercises through their Makefiles rather than invoking ELF32 files directly.
- Docker daemon error: start Docker Desktop.
- Architecture warning during build: expected on Apple Silicon.
- GDB cannot disable ASLR: container security may prevent it; stepping and breakpoints still work. For controlled exploit exercises, run a shell with `docker compose run --rm --cap-add=SYS_PTRACE --security-opt seccomp=unconfined x86-harness`.
- On newer Compose versions use `docker compose`, not the retired `docker-compose` command.

Only run security exercises against the intentionally vulnerable programs in this course.
