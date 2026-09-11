# Module 19: Binary Protections

## Objective

Canaries, NX, PIE, ASLR, RELRO, and the purpose of ROP.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    protections: identified

Run it with make run MODULE=19-protections and verify with make test-module MODULE=19-protections. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

