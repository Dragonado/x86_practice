# Module 06: The Stack

## What you're learning

Understand the downward-growing x86 stack and how `push`, `pop`, `call`, and `ret` change `ESP` and memory.

## Your task

Place two non-42 values on the stack, retrieve them in last-in-first-out order, combine them to obtain 42, and print the computed value.

The exact output must be:

```text
stack value: 42
```

## Implementation requirements

- Record the initial `ESP` so you can verify that it is restored.
- Use at least two `push` operations and matching `pop` operations.
- Demonstrate the reversed retrieval order intentionally.
- Compute 42 only after retrieving the values.
- Leave `ESP` at its original value before invoking `exit`.

## Shortcuts that defeat the exercise

- Do not store 42 as the initial stack value.
- Do not read the values directly from their original `.data` locations after pushing them.
- Do not fix an unbalanced stack merely by copying an old address into `ESP` without understanding what was left behind.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- After each push, examine four words at `$esp` in GDB.
- A 32-bit push subtracts four from `ESP` before storing.
- Your syscall setup can overwrite registers after the stack demonstration is complete.

## Run and inspect

```sh
make run MODULE=06-stack
make test-module MODULE=06-stack
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which pushed value is popped first?
- How many bytes did `ESP` move?
- How is `call` related to a push, and how is `ret` related to a pop?
