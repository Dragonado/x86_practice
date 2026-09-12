# Module 12: Reverse Engineering

## What you're learning

Learn to infer behavior from an executable using `file`, `strings`, `nm`, `readelf`, and `objdump`, then validate hypotheses dynamically instead of trusting symbol names or source.

## Your task

Treat the supplied reference executable as a black box: build it without opening `solution.asm`, identify how it obtains a hidden numeric value, and write your own independent starter that reproduces the result.

The exact output must be:

```text
recovered value: 42
```

## Implementation requirements

- Do not inspect `solution.asm` until after completing your analysis.
- Record the executable format, entry point, relevant sections, and useful symbols.
- Locate the output path and trace backward to the instructions responsible for the numeric value.
- Confirm the suspected value in GDB by observing a register or memory location.
- Implement equivalent behavior in your own code and print the required result.

## Shortcuts that defeat the exercise

- Do not obtain the answer by reading the expected-output assignment in `test.sh`.
- Do not use `strings` as your only analysis technique.
- Do not copy instructions mechanically without explaining their purpose.
- Do not patch or modify the reference executable.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Start broad with `file`, `readelf -h`, `readelf -S`, `nm`, and `strings`, then narrow down with `objdump -d -M intel`.
- Cross-references between code and `.data` often identify output buffers.
- A static observation becomes much stronger when a breakpoint confirms it at runtime.

## Run and inspect

```sh
make run MODULE=12-reverse-engineering
make test-module MODULE=12-reverse-engineering
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- How did you distinguish code addresses from data addresses?
- Which evidence revealed the value-producing logic?
- What information disappears when symbols are stripped?
