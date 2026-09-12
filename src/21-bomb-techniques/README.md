# Module 21: Bomb Lab Techniques

## What you're learning

Practice Bomb Lab reasoning patterns: input parsing, comparisons, loops, switch-like jump tables, and small recursive functions.

## Your task

Implement a miniature phase checker with several independent conditions. Store a candidate input separate from the success message, evaluate every condition, and reach the defused path only when all checks pass.

The exact output must be:

```text
bomb phase: defused
```

## Implementation requirements

- Include at least one arithmetic condition and one control-flow condition.
- Use a loop, table lookup, or small recursive helper for another condition.
- Route every failed check to one shared failure path.
- Keep success and failure output paths distinct.
- Change each candidate input independently to prove every check can fail.

## Shortcuts that defeat the exercise

- Do not jump directly to the defused label.
- Do not encode the candidate as a pointer to the success message.
- Do not remove failure paths after finding the passing values.
- Do not inspect actual CS6265 answers or publish course-provided bomb solutions.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Solve one constraint at a time and keep a table of inputs, observations, and conclusions.
- Work backward from calls or branches that lead to failure.
- Use breakpoints immediately before comparisons to observe both operands.

## Run and inspect

```sh
make run MODULE=21-bomb-techniques
make test-module MODULE=21-bomb-techniques
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which evidence established each required input?
- How did the compiler or assembler represent the loop/table/recursion?
- How can you distinguish signed from unsigned comparisons in disassembly?
