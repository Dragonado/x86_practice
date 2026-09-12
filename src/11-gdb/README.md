# Module 11: GDB Basics

## What you're learning

Use GDB to observe a program at instruction granularity instead of guessing: breakpoints, registers, memory examination, disassembly, `stepi`, and `nexti`.

## Your task

Build a short calculation from several intermediate values, use GDB to locate why its first version produces the wrong value, correct only the faulty operation, and print 42.

The exact output must be:

```text
debug value: 42
```

## Implementation requirements

- Use at least three instructions to produce the result so there is meaningful state to inspect.
- Set a breakpoint before the calculation and step through every instruction.
- Record the relevant register after each step in a comment or your learning notes.
- Examine the output buffer in memory before the `write` call.
- Confirm the corrected executable, not only the source, contains your change.

## Shortcuts that defeat the exercise

- Do not replace the calculation with a direct constant after finding the bug.
- Do not use only `run`; the point is to stop and inspect.
- Do not assume source line stepping corresponds one-to-one with machine instructions.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Useful commands include `break _start`, `run`, `display/i $pc`, `info registers`, `x/16xb ADDRESS`, and `stepi`.
- If GDB launches the ELF32 program poorly under emulation, use `qemu-i386 -g PORT` and connect with `target remote`.
- Compare `disassemble /r _start` with the source.

## Run and inspect

```sh
make run MODULE=11-gdb
make test-module MODULE=11-gdb
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- What is the difference between `step` and `stepi`?
- What do `$pc`, `$eip`, and `$esp` represent?
- How did the incorrect value first enter the computation?
