# Module 22: Shellcode Practice

## Objective

Building and inspecting a harmless position-independent write payload.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    pic payload: works

Run it with make run MODULE=22-shellcode-lab and verify with make test-module MODULE=22-shellcode-lab. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

