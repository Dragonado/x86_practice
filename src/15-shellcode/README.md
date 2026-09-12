# Module 15: Shellcode Fundamentals

## What you're learning

Learn why injected code must often be position-independent, compact, and free of forbidden bytes. Practice the jmp-call-pop technique with a harmless write-and-exit payload.

## Your task

Write a position-independent code fragment that discovers the address of its own embedded message at runtime, prints the required text, and exits.

The exact output must be:

```text
shellcode bytes: understood
```

## Implementation requirements

- Obtain the embedded message address through control flow or another position-independent technique.
- Avoid absolute addresses in the payload code.
- Use direct Linux i386 syscalls.
- Extract the `.text` bytes after building and inspect them for zero bytes.
- Document any zero bytes that remain and identify which instruction introduced each one.

## Shortcuts that defeat the exercise

- Do not use an absolute `.data` address for the message.
- Do not execute a shell or access the network; this exercise's payload only writes fixed text and exits.
- Do not claim the payload is null-free without inspecting the emitted bytes.
- Do not test the bytes against programs outside this course.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- A `call` stores the address of its following instruction on the stack.
- Keeping code and message bytes together simplifies position independence.
- `objcopy` can extract a section, while `objdump -d` shows which bytes encode each instruction.

## Run and inspect

```sh
make run MODULE=15-shellcode
make test-module MODULE=15-shellcode
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Why would an absolute linker-assigned address break after injection elsewhere?
- How does jmp-call-pop recover the message address?
- Why are zero bytes problematic for some injection paths?
