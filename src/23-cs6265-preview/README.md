# Module 23: CS6265 Lab Preview

## What you're learning

Combine the course workflow: identify an unknown ELF, inspect protections, recover control flow, debug assumptions, implement a safe input or payload, and document evidence.

## Your task

Build a three-phase local capstone. One phase checks arithmetic, one checks a memory/string property, and one calls a function using the correct convention. Print the readiness output only after all phases succeed.

The exact output must be:

```text
course: ready
```

## Implementation requirements

- Give each phase its own function and failure condition.
- Use at least one loop, one conditional branch, and one stack argument.
- Inspect the final executable with `file`, `readelf`, and `objdump` before running it.
- Use GDB to confirm at least one hypothesis about each phase.
- Keep a private record of inputs, breakpoints, observations, and conclusions.

## Shortcuts that defeat the exercise

- Do not make any phase return success unconditionally.
- Do not store all passing results directly as final constants.
- Do not target real course infrastructure or publish course-provided lab answers.
- Do not skip static analysis and solve solely by reading your own source; revisit the compiled binary as if it were unfamiliar.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Use a repeatable sequence: triage, map functions and data, form a hypothesis, test it, then document it.
- Solve phases independently before combining them.
- A correct answer without evidence is less valuable than a wrong hypothesis that you methodically correct.

## Run and inspect

```sh
make run MODULE=23-cs6265-preview
make test-module MODULE=23-cs6265-preview
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Can you explain every branch controlling success?
- Can you locate arguments, locals, and return values in both source and disassembly?
- Can you state which protection assumptions your workflow depends on?
- Could another learner reproduce your reasoning from your private notes?
