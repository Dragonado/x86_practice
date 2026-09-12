# Module 19: Binary Protections

## What you're learning

Recognize stack canaries, NX, PIE/ASLR, and RELRO in ELF files and understand what each protection prevents—and what it does not.

## Your task

Build controlled variants of a tiny local program with protection settings changed one at a time, inspect their ELF metadata and disassembly, and emit success only after recording the observed differences.

The exact output must be:

```text
protections: identified
```

## Implementation requirements

- Inspect at least one protected and one deliberately weakened course binary.
- Use `readelf` and disassembly rather than relying only on a summary tool.
- Identify evidence for executable-stack policy, PIE, stack-canary code, and RELRO.
- Change one compiler or linker property at a time so comparisons remain meaningful.
- Record findings in your private progress notes before printing the checkpoint output.

## Shortcuts that defeat the exercise

- Do not describe a protection as universally preventing exploitation.
- Do not disable protections globally on the Mac or Docker Desktop.
- Do not analyze third-party binaries without permission.
- Do not print the checkpoint output before performing the inspection.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Program headers reveal stack permissions; ELF type helps distinguish PIE; imports can reveal canary failure handling.
- ASLR is an operating-system behavior, while PIE determines whether the main executable can benefit fully from relocation.
- Full and partial RELRO differ in when relocation-related memory becomes read-only.

## Run and inspect

```sh
make run MODULE=19-protections
make test-module MODULE=19-protections
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which protection detects stack corruption?
- Which protection prevents ordinary stack pages from executing?
- Why are PIE and ASLR related but not identical?
- What does RELRO protect?
