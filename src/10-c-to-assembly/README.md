# Module 10: Reading Assembly from C

## What you're learning

Recognize how high-level variables, expressions, `if` statements, and returns become register operations and jumps.

## Your task

Translate the provided behavior into assembly: start with input 21; if it is greater than 10, return twice the input, otherwise return the input plus one. Print the returned result.

The exact output must be:

```text
c pattern: 42
```

## Implementation requirements

- Implement both branches even though the supplied input selects only one.
- Use a comparison and the correct signed conditional jump.
- Keep the shared printing code outside the two calculation branches.
- Make changing the input to 10 produce 11 without restructuring the program.
- Treat the computed value as an integer until the output-conversion step.

## Shortcuts that defeat the exercise

- Do not replace the function with `mov ..., 42`.
- Do not delete the branch that is not selected by input 21.
- Do not confuse the source-level value with its ASCII representation.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Write the equivalent C function on paper and assign each local value to a register.
- Compile a tiny C version inside the container with `gcc -m32 -S -masm=intel` and compare patterns, but do not copy it blindly.
- Look for the compare, branch, and join point in your disassembly.

## Run and inspect

```sh
make run MODULE=10-c-to-assembly
make test-module MODULE=10-c-to-assembly
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which instructions implement the `if` condition?
- Where do both branches rejoin?
- What changes in unoptimized versus optimized compiler output?
