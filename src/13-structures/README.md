# Module 13: Structures and Unions

## What you're learning

Understand that a structure is contiguous memory interpreted through named field offsets, and that alignment can introduce padding between fields.

## Your task

Define a record with fields of different widths, create one initialized instance, load the field whose value is 42 through the record base plus its field offset, and print that value.

The exact output must be:

```text
struct field: 42
```

## Implementation requirements

- Define the layout once with NASM structure facilities or explicit named offset constants.
- Include at least one byte-sized field and one dword-sized field.
- Account explicitly for any padding needed to align the dword field.
- Calculate the target address from the instance base and field offset.
- Load the value using the field's correct operand size before converting it to text.

## Shortcuts that defeat the exercise

- Do not define a separate label directly on the target value and load through that shortcut.
- Do not assume every field begins immediately after the previous field.
- Do not hardcode 42 into the output buffer.
- Do not confuse a structure definition, which describes offsets, with an instance, which occupies storage.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Hints without the solution

- Draw a table with offset, size, and meaning for every byte in the record.
- Use `x/16xb` in GDB to see padding and little-endian byte order.
- Change an earlier field's size and predict which later offsets must change.

## Run and inspect

```sh
make run MODULE=13-structures
make test-module MODULE=13-structures
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- What is the total record size including padding?
- Why can a union's fields share offset zero?
- How would an array of these records be indexed?
