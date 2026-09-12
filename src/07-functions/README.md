# Module 07: Functions and cdecl

## What you're learning

Learn the 32-bit cdecl convention: stack arguments, an `EBP`-based frame, caller cleanup, saved registers, and return values in `EAX`.

## Your task

Write a separate function that receives two integer arguments through the stack and returns their sum. Call it with two values whose sum is 42, then print the returned value.

The exact output must be:

```text
function result: 42
```

## Implementation requirements

- Push arguments in cdecl order before using `call`.
- Create and tear down a conventional stack frame inside the function.
- Access arguments relative to `EBP`, not through global labels.
- Return the result in `EAX`.
- Have the caller remove the arguments from the stack after the call.

## Shortcuts that defeat the exercise

- Do not let the function read the operands from global variables.
- Do not put 42 directly in `EAX`.
- Do not jump into or out of the function in place of `call` and `ret`.
- Do not leave the caller's stack arguments allocated.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- At function entry, the stack already contains a return address.
- Sketch the positions of saved `EBP`, the return address, and both arguments before coding.
- Break at the function and examine memory around `$ebp`.

## Run and inspect

```sh
make run MODULE=07-functions
make test-module MODULE=07-functions
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Why are the arguments at positive `EBP` offsets?
- Who restores the argument space in cdecl?
- Which registers must a callee preserve?
