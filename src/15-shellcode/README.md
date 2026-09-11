# Module 15: Shellcode Fundamentals

## Objective

Position independence, jmp-call-pop, null-byte awareness, and execve.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    shellcode bytes: understood

Run it with make run MODULE=15-shellcode and verify with make test-module MODULE=15-shellcode. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

