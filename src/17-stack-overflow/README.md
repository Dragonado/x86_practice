# Module 17: Stack Overflow Mechanics

## Objective

How overflowing a local buffer can reach saved EBP and the return address.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    offset concept: understood

Run it with make run MODULE=17-stack-overflow and verify with make test-module MODULE=17-stack-overflow. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

