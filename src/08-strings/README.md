# Module 08: String Operations

## What you're learning

Work with byte strings and the x86 string instructions `lods`, `stos`, `scas`, `movs`, and `cmps`, including `rep` prefixes and the direction flag.

## Your task

Determine the length of a null-terminated 11-character input string at runtime and print the decimal length.

The exact output must be:

```text
string length: 11
```

## Implementation requirements

- Store the input with a terminating zero that is not counted in the result.
- Scan memory until the terminator is found; do not use a stored length constant for the answer.
- Use at least one x86 string instruction and an appropriate repetition mechanism.
- Set the direction flag deliberately before scanning.
- Convert the measured length to printable decimal digits.

## Shortcuts that defeat the exercise

- Do not place integer 11 directly in the result register.
- Do not store `11` as the initial output text.
- Do not include the null terminator in the reported length.
- Do not assume the direction flag has a particular value without setting it.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- A scan instruction compares an accumulator byte with memory at `EDI`.
- Some repeated scans leave a counter expressed as the number of bytes not visited.
- Inspect `EDI`, `ECX`, and `ZF` before and after the repeated instruction.

## Run and inspect

```sh
make run MODULE=08-strings
make test-module MODULE=08-strings
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Why does the terminator occupy memory but not count as string content?
- Which way does `EDI` move when the direction flag is clear?
- How would the code change for a bounded string?
