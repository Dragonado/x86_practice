# Module 10: Reading Assembly from C

## Objective

Recognizing compiled forms of C conditionals, loops, and expressions.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    c pattern: 42

Run it with make run MODULE=10-c-to-assembly and verify with make test-module MODULE=10-c-to-assembly. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

