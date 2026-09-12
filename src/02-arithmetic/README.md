# Module 02: Arithmetic and Flags

## What you're learning

Practice integer arithmetic with `add`, `sub`, multiplication, division, and the status flags those operations modify. Also learn that a binary integer is not automatically printable decimal text.

## Your task

Compute the integer 42 from two different input values at runtime, convert the result into two decimal ASCII digits, place those digits in an output buffer, and print the buffer.

The exact output must be:

```text
arithmetic result: 42
```

## Implementation requirements

- Keep the input operands in memory or registers; neither input may already equal 42.
- Produce 42 with an arithmetic instruction rather than placing 42 directly in the result register.
- Derive the tens and ones digits from the computed integer using division by 10.
- Convert numeric digits to ASCII before storing them in the output buffer.
- Print the completed buffer and exit successfully.

## Shortcuts that defeat the exercise

- Do not store the characters `42` together anywhere in the initial data.
- Do not replace the digit-conversion work with a prebuilt result string.
- Do not rely on a register retaining its value across code that deliberately overwrites it.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- For unsigned division, the dividend uses a register pair; determine which half must be cleared first.
- A quotient and remainder naturally correspond to the tens and ones digits for values below 100.
- Inspect `EFLAGS` in GDB immediately after each arithmetic instruction.

## Run and inspect

```sh
make run MODULE=02-arithmetic
make test-module MODULE=02-arithmetic
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- How are integer 42 and ASCII characters `4` and `2` different in memory?
- Where does the division remainder appear?
- Which arithmetic instructions modify the carry and overflow flags?
