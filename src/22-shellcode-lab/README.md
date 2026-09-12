# Module 22: Shellcode Practice

## What you're learning

Turn position-independent assembly into raw bytes and test that byte sequence in a controlled harness, while understanding instruction encoding constraints.

## Your task

Write a harmless position-independent payload that prints the exact required text and exits, extract its raw bytes, and execute only those bytes in the provided container environment.

The exact output must be:

```text
pic payload: works
```

## Implementation requirements

- Keep code and embedded data position-independent.
- Extract raw bytes from the intended executable section rather than copying opcodes by eye.
- Display the payload length and a hexadecimal byte representation during development.
- Check for forbidden zero bytes and revise or document their source.
- Verify execution from a different mapped address than the original linked address.

## Shortcuts that defeat the exercise

- Do not hardcode an absolute message address.
- Do not execute `/bin/sh`, make network connections, or access files.
- Do not paste shellcode from the internet.
- Do not run the payload outside the isolated course harness.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Compare linked disassembly with the extracted byte stream so every byte has an explanation.
- Position independence and null-byte avoidance are separate properties.
- A tiny C or Python harness may allocate executable test memory inside the container, but keep it local and deterministic.

## Run and inspect

```sh
make run MODULE=22-shellcode-lab
make test-module MODULE=22-shellcode-lab
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- How did the payload find its data?
- How did you prove relocation did not break it?
- Which instruction encodings were responsible for any forbidden bytes?
