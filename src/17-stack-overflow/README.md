# Module 17: Stack Overflow Mechanics

## What you're learning

Understand spatial relationships in a stack frame: local buffers, saved frame pointers, return addresses, and why an unchecked copy can corrupt control data.

## Your task

Construct a safe stack-frame model with a local byte buffer and a separate sentinel value. Copy a bounded pattern into the buffer, calculate the offset from its beginning to the sentinel, and print success only when the sentinel remains unchanged and your calculated layout is correct.

The exact output must be:

```text
offset concept: understood
```

## Implementation requirements

- Create a conventional stack frame and reserve local space explicitly.
- Place the buffer and sentinel at documented `EBP`-relative offsets.
- Calculate their distance from addresses or named offsets rather than hardcoding the final displayed concept.
- Keep the copy bounded so it cannot reach the sentinel.
- Inspect the frame in GDB and draw where the saved `EBP` and return address reside.

## Shortcuts that defeat the exercise

- Do not overwrite the real return address in this module.
- Do not disable the copy bound merely to observe a crash.
- Do not run experiments against software outside this intentionally controlled course.
- Do not print success without checking the sentinel.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Remember that stack locals normally use negative `EBP` offsets while the saved return address is above `EBP`.
- Examine stack bytes before and after the copy.
- The distance between two addresses is subtraction, but be careful about which address is larger.

## Run and inspect

```sh
make run MODULE=17-stack-overflow
make test-module MODULE=17-stack-overflow
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which direction does the stack grow?
- How many bytes separate the buffer start, sentinel, saved frame pointer, and return address?
- Why does endianness matter when control data is overwritten byte by byte?
