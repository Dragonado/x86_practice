# Module 05: Loops

## Objective

Counter-controlled loops, dec/jnz, factorial, and Fibonacci patterns.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    loop sum: 55

Run it with make run MODULE=05-control-flow-2 and verify with make test-module MODULE=05-control-flow-2. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

