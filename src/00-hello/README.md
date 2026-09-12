# Module 00: Hello, World

## What you're learning

Learn the shape of a minimal Linux i386 program: ELF sections, labels, byte data, the `int 0x80` system-call interface, and a clean process exit.

## Your task

Place the message in `.data`, pass its address and length to the Linux `write` system call, then terminate with `exit(0)`.

The exact output must be:

```text
hello, x86
```

## Implementation requirements

- Declare the text as bytes and include a trailing newline byte.
- Calculate its length with an assembler expression instead of typing the length manually.
- Invoke 32-bit Linux `write` directly with `int 0x80`.
- Send the bytes to file descriptor 1 and exit with status zero.

## Shortcuts that defeat the exercise

- Do not call C library functions such as `printf`.
- Do not print the message one character at a time.
- Do not hardcode the message length in `EDX`.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Identify the four registers used for the i386 system-call number and its first three arguments.
- A label names an address; square brackets read memory at an address.
- Use `objdump -d -M intel` after building to find both system calls.

## Run and inspect

```sh
make run MODULE=00-hello
make test-module MODULE=00-hello
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Why does `write` not need a null terminator?
- What value does `write` return in `EAX`?
- Which section contains the string, and which contains instructions?
