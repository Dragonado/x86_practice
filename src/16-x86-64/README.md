# Module 16: x86-64 Differences

## What you're learning

Contrast i386 with x86-64: wider registers, additional registers, RIP-relative addressing, the `syscall` instruction, and the System V AMD64 calling convention.

## Your task

Implement the output as a genuine ELF64 program using the x86-64 syscall ABI and RIP-relative addressing.

The exact output must be:

```text
mode: x86-64
```

## Implementation requirements

- Assemble as `elf64` and link as `elf_x86_64` using the supplied Makefile.
- Use `syscall`, not `int 0x80`.
- Place the syscall number and arguments in the x86-64 ABI registers.
- Obtain the message address relative to `RIP`.
- Exit with a zero status using the 64-bit exit syscall.

## Shortcuts that defeat the exercise

- Do not copy the Module 00 register assignments unchanged.
- Do not use a 32-bit absolute address for the message.
- Do not use i386 syscall numbers.
- Do not change the Makefile back to a 32-bit output format.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Compare disassemblies from Modules 00 and 16 side by side.
- The fourth function argument and the fourth syscall argument use different registers in the AMD64 conventions.
- Writing a 32-bit subregister clears the upper half of its 64-bit parent register.

## Run and inspect

```sh
make run MODULE=16-x86-64
make test-module MODULE=16-x86-64
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which registers carry the first three syscall arguments?
- Why is RIP-relative code easier to relocate?
- What are the major differences between `call` conventions in i386 cdecl and System V AMD64?
