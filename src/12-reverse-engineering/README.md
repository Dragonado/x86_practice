# Module 12: Reverse Engineering

## Objective

Using objdump, nm, strings, and control-flow reasoning.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    recovered value: 42

Run it with make run MODULE=12-reverse-engineering and verify with make test-module MODULE=12-reverse-engineering. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

