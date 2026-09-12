# Module 04: Conditional Control Flow

## What you're learning

Learn how `cmp` and `test` set flags and how conditional jumps turn those flags into `if`/`else` behavior.

## Your task

Compare two runtime values and choose between separate `equal` and `not equal` output paths. With the supplied inputs, the equal path must run.

The exact output must be:

```text
branch: equal
```

## Implementation requirements

- Load both comparison values from named data or compute them independently.
- Use `cmp` or `test` followed by a conditional jump.
- Keep the equal and not-equal messages in separate labeled paths.
- Join both paths at one common exit sequence.
- Make changing one input cause the other branch to execute.

## Shortcuts that defeat the exercise

- Do not jump unconditionally to the equal message.
- Do not omit the unused branch merely because the current inputs are equal.
- Do not encode the comparison result directly as the selected message address.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- `cmp a, b` sets flags as though it calculated `a - b`, but discards that result.
- Step across the conditional jump in GDB and inspect `ZF`.
- Temporarily change one operand after your first passing test to prove the other branch works.

## Run and inspect

```sh
make run MODULE=04-control-flow-1
make test-module MODULE=04-control-flow-1
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which flag represents equality?
- Why does the order of operands matter for signed greater/less comparisons?
- What is the difference between signed and unsigned conditional jumps?
