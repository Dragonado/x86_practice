# Module 14: System Calls

## Objective

The Linux i386 ABI for open, read, write, close, and exit.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    syscall write: ok

Run it with make run MODULE=14-syscalls and verify with make test-module MODULE=14-syscalls. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

