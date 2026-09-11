# Module 13: Structures and Unions

## Objective

Field offsets, padding, alignment, and base-plus-offset access.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    struct field: 42

Run it with make run MODULE=13-structures and verify with make test-module MODULE=13-structures. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

