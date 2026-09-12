# Module 03: Logical and Bitwise Operations

## What you're learning

Learn to treat registers as collections of bits using `and`, `or`, `xor`, `not`, shifts, and rotates rather than only as whole decimal numbers.

## Your task

Recover the integer 42 from an encoded input using bitwise operations, verify selected bits with masks, convert the value to printable decimal digits, and print it.

The exact output must be:

```text
bitwise result: 42
```

## Implementation requirements

- Begin with an encoded value that is not 42.
- Use at least one mask and one shift or rotate while deriving or validating the result.
- Use `xor` as part of the transformation.
- Store the printable digits only after the bitwise computation succeeds.
- Exit nonzero or print nothing if your validation mask does not match.

## Shortcuts that defeat the exercise

- Do not place integer 42 directly into the result register.
- Do not store the final text `42` in the initial output buffer.
- Do not use arithmetic addition or subtraction as a substitute for the required bitwise transformation.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Write the encoded value, masks, and expected result in binary on paper first.
- `test` performs an AND for flags without saving the result.
- Watch `ZF` and `CF` in GDB after masks and shifts.

## Run and inspect

```sh
make run MODULE=03-bitwise
make test-module MODULE=03-bitwise
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which bits did each mask preserve?
- Why is XOR reversible when the same mask is used twice?
- How do logical and arithmetic right shifts differ?
