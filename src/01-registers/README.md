# Module 01: Registers

## Objective

Learn how general-purpose registers temporarily hold values, how their 8-bit and
32-bit forms differ, and how addresses differ from the bytes stored at those
addresses. Practice `mov`, `lea`, and `xchg`.

## Exercise

Write a program whose data begins with the two output digits in reverse order.
At runtime, use registers to rearrange those bytes before printing them. Its
exact output must be:

```text
register result: 42
```

Your implementation must:

- Store the two digits initially as `24`, not `42`.
- Load the digits from memory into two 8-bit registers.
- Swap the register values with `xchg`.
- Write the swapped values back into the output buffer.
- Use `lea` to obtain the output buffer's address for the `write` system call.
- Exit with status zero.

Do not satisfy the test by storing the finished `42` directly in the source.
The output test cannot detect that shortcut, but it skips the lesson.

Run your program and then test it:

```sh
make run MODULE=01-registers
make test-module MODULE=01-registers
```

Check `solution.asm` only after making a serious attempt.

## Things to reason about

- Which names refer to complete 32-bit registers, and which refer only to their
  lowest 8 bits?
- What changes when an operand is written with square brackets?
- Why must the swapped bytes be written back to memory before `write` runs?
- Which registers will later be overwritten while preparing the system call?

## Inspect and debug

From `make shell`, build your starter and inspect it with
`objdump -d -M intel`. In GDB, break at `_start`, then use `run`,
`display/i $pc`, `info registers`, and `stepi`. Watch the selected byte-sized
registers and examine the output buffer before and after the swap.

## Checkpoint

Without consulting the solution, explain:

1. Where each digit begins in memory.
2. Which register holds each digit immediately before and after `xchg`.
3. Why changing a register alone does not automatically change the buffer.
4. Which registers carry the `write` system-call number and arguments.
