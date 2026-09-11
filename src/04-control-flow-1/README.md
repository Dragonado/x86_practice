# Module 04: Conditional Control Flow

## Objective

cmp, test, unconditional jumps, and conditional jumps.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    branch: equal

Run it with make run MODULE=04-control-flow-1 and verify with make test-module MODULE=04-control-flow-1. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

