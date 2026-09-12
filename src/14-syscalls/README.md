# Module 14: System Calls

## What you're learning

Go beyond `write` and understand the Linux i386 syscall ABI for opening, reading, writing, closing, and exiting, including return-value and error handling.

## Your task

Create a temporary file through Linux syscalls, write the bytes `ok` into it, close and reopen it, read the bytes back into a `.bss` buffer, and print the prefix followed by the bytes actually read.

The exact output must be:

```text
syscall write: ok
```

## Implementation requirements

- Use direct `int 0x80` system calls rather than libc wrappers.
- Keep the file descriptor returned by `open` and reuse it for `write`, `read`, and `close`.
- Check syscall return values for negative errors before using them.
- Read into reserved writable storage rather than the original constant.
- Pass the number of bytes actually read to the final stdout `write`.
- Use a file under `/tmp`, and close every successfully opened descriptor.

## Shortcuts that defeat the exercise

- Do not print a hardcoded final `ok` without reading it back.
- Do not assume the opened file descriptor will be a particular number.
- Do not pass the pathname bytes themselves where the kernel expects their address.
- Do not continue as if a syscall succeeded when `EAX` is negative.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- For i386 syscalls, `EAX` selects the operation and also carries its return value.
- Save a successful file descriptor before preparing the next syscall number.
- Use `strace` inside the container, if available, to compare your intended calls with actual calls.

## Run and inspect

```sh
make run MODULE=14-syscalls
make test-module MODULE=14-syscalls
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- How are successful and failed syscall returns represented?
- Why is a read buffer placed in `.bss` rather than `.text`?
- Which arguments differ between opening a file for creation and reopening it for reading?
