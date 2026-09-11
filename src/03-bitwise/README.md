# Module 03: Logical and Bitwise Operations

## Objective

and, or, xor, not, shifts, and rotates.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    bitwise result: 42

Run it with make run MODULE=03-bitwise and verify with make test-module MODULE=03-bitwise. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

