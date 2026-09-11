# Module 09: Arrays and Memory

## Objective

Immediate, register, base-plus-index, and scaled-index addressing.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    array sum: 15

Run it with make run MODULE=09-arrays and verify with make test-module MODULE=09-arrays. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

