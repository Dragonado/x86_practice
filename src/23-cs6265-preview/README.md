# Module 23: CS6265 Lab Preview

## Objective

An end-to-end workflow: triage, disassemble, debug, reason, test, and document.

## Exercise

Replace the TODO program in starter.asm so its exact output is:

    course: ready

Run it with make run MODULE=23-cs6265-preview and verify with make test-module MODULE=23-cs6265-preview. Check solution.asm only after attempting it.

## Inspect and debug

From make shell, build the solution and inspect it with objdump -d -M intel. In GDB, break at _start, then use run, display/i $pc, info registers, and stepi.

## Checkpoint

Explain which registers carry the system-call number and arguments, and predict the next instruction before each GDB step.

