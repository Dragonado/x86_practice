# Module 00: Hello, World

## Objective

Linux process sections and the 32-bit write/exit system calls.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    hello, x86

Run it with make run MODULE=00-hello and verify with make test-module MODULE=00-hello. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

