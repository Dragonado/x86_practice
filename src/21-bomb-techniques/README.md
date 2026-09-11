# Module 21: Bomb Lab Techniques

## Objective

Tracing comparisons, loops, switch tables, recursion, and input parsing.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    bomb phase: defused

Run it with make run MODULE=21-bomb-techniques and verify with make test-module MODULE=21-bomb-techniques. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

