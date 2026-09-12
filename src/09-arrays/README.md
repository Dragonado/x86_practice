# Module 09: Arrays and Memory

## What you're learning

Use base-plus-index and scaled-index addressing to traverse arrays whose elements occupy more than one byte.

## Your task

Sum a five-element integer array containing the values 1 through 5, convert the computed result to decimal, and print it.

The exact output must be:

```text
array sum: 15
```

## Implementation requirements

- Declare five numeric array elements using a consistent element width.
- Keep the base address and index or pointer in registers.
- Load each element from memory inside a loop.
- Use scaled-index addressing or advance a pointer by the element size.
- Stop based on the element count, not by searching for a sentinel value.

## Shortcuts that defeat the exercise

- Do not initialize the result to 15.
- Do not write five separate loads or additions.
- Do not treat a dword array as though adjacent elements were one byte apart.
- Do not store `15` as finished output text.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- For dword elements, index 1 is four bytes after index 0.
- An effective address can combine a base, index, and scale.
- Use GDB's word-display commands to compare logical elements with raw bytes.

## Run and inspect

```sh
make run MODULE=09-arrays
make test-module MODULE=09-arrays
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- What address contains element `i`?
- Why must the scale match the element width?
- How would the code change for a byte array?
