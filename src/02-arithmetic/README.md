# Module 02: Arithmetic and Flags

## Objective

Integer arithmetic and how operations update EFLAGS.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    arithmetic result: 42

Run it with make run MODULE=02-arithmetic and verify with make test-module MODULE=02-arithmetic. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

