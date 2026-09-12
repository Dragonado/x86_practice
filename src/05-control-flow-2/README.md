# Module 05: Loops

## What you're learning

Build repetition from labels, counters, and conditional jumps. Understand the difference between the `loop` instruction and an explicit `dec`/`jnz` loop.

## Your task

Calculate the sum of the integers from 1 through 10 by visiting each value in a loop, convert the resulting 55 to decimal text, and print it.

The exact output must be:

```text
loop sum: 55
```

## Implementation requirements

- Initialize a running total and a loop counter separately.
- Execute a loop body exactly ten times.
- Update the total from the current counter value on every iteration.
- Control repetition with either `loop` or an explicit decrement and conditional jump.
- Convert the computed sum into the two output digits at runtime.

## Shortcuts that defeat the exercise

- Do not use the closed-form formula for the sum.
- Do not initialize the total to 55.
- Do not unroll ten additions into ten copied instructions.
- Do not store `55` as prebuilt output text.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Use GDB to stop at the loop label and display the counter and accumulator each time.
- Be careful whether your counter runs upward or downward.
- The flags used by a manual loop may come from the decrement rather than the addition.

## Run and inspect

```sh
make run MODULE=05-control-flow-2
make test-module MODULE=05-control-flow-2
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- What are the accumulator and counter after iterations 1, 5, and 10?
- Does your loop execute when the initial count is zero?
- Which version is clearer: `loop` or `dec`/`jnz`, and why?
