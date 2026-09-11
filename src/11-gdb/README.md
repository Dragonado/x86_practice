# Module 11: GDB Basics

## Objective

Breakpoints, register inspection, memory examination, disassembly, and stepping.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    debug value: 42

Run it with make run MODULE=11-gdb and verify with make test-module MODULE=11-gdb. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

