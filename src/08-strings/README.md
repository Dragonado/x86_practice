# Module 08: String Operations

## Objective

movs, cmps, scas, stos, lods, and REP prefixes.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    string length: 11

Run it with make run MODULE=08-strings and verify with make test-module MODULE=08-strings. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

