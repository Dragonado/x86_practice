# Module 16: x86-64 Differences

## Objective

RAX-R15, RIP-relative addressing, syscall, and the System V AMD64 ABI.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    mode: x86-64

Run it with make run MODULE=16-x86-64 and verify with make test-module MODULE=16-x86-64. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

