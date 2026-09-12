# Module 03: Logical and Bitwise Operations

## What you're learning

Learn to treat registers as collections of bits using `and`, `or`, `xor`, `not`, shifts, and rotates rather than only as whole decimal numbers.

## Your task

Decode one specifically defined byte, validate both nibbles of the decoded value,
convert it to decimal text, and print it. The encoded byte is `0xFE`; it was
created by swapping the two nibbles of the original byte and then applying the
XOR key `0x5C`.

Reverse those operations in this order:

1. Load the encoded byte `0xFE` from memory.
2. XOR it with `0x5C`. The intermediate byte should now be `0xA2`.
3. Rotate that **8-bit value** right by four bits. This swaps its nibbles and
   produces `0x2A`, which is decimal 42.
4. Validate the decoded byte as described below.
5. Only after validation, convert 42 into the ASCII digits `4` and `2` and
   place them in the output buffer.

The exact output must be:

```text
bitwise result: 42
```

## Implementation requirements

- Declare the encoded input as one byte containing `0xFE` and the XOR key as
  one byte containing `0x5C`.
- Perform the XOR at runtime; do not store the decoded intermediate value in
  the source.
- Use an 8-bit rotate by four positions to swap the nibbles. A 32-bit rotate
  has different behavior and does not satisfy this exercise.
- Preserve the decoded value while validating it. Use a copy for each
  destructive mask operation.
- Validate the upper nibble with mask `0xF0`; the masked result must equal
  `0x20`.
- Validate the lower nibble with mask `0x0F`; the masked result must equal
  `0x0A`.
- Send either failed comparison to a failure path that exits with status 1
  without printing the success message.
- On success, divide the decoded integer by 10 and convert the quotient and
  remainder into ASCII digits, as in Module 02.
- Store the printable digits only after both nibble checks pass.

## Shortcuts that defeat the exercise

- Do not place integer 42 directly into the result register.
- Do not declare `0xA2` or `0x2A` as data; they must result from the runtime
  transformation.
- Do not store the final text `42` in the initial output buffer.
- Do not use arithmetic addition or subtraction as a substitute for the required bitwise transformation.
- Do not validate by comparing the entire decoded byte directly with `0x2A`;
  the point is to practice masks on its two component nibbles.

The automated test checks observable output, so it cannot prove that you used the required technique. Treat these constraints as part of the test.

## Trace the transformation on paper first

```text
encoded byte       0xFE    1111 1110
XOR key            0x5C    0101 1100
                           ---------
after XOR           0xA2    1010 0010

rotate right by 4   0x2A    0010 1010
upper mask          0xF0    1111 0000  -> 0x20
lower mask          0x0F    0000 1111  -> 0x0A
```

## Hints without the assembly sequence

- The rotate must operate on a byte-sized register so the low nibble wraps
  around into the high nibble of that same byte.
- `and` changes its destination, which is why validation should operate on a
  copy of the successfully decoded value.
- `test` is useful when you only care whether selected bits are zero, but
  these checks require comparing the masked values with specific nonzero
  patterns.
- Watch the byte register and `ZF` in GDB after the XOR, rotate, masks, and
  comparisons.

## Run and inspect

```sh
make run MODULE=03-bitwise
make test-module MODULE=03-bitwise
```

Build inside `make shell` and inspect your executable with `objdump -d -M intel`. Use GDB to break at `_start`, display the next instruction, inspect registers, and step one machine instruction at a time. Check `solution.asm` only after a serious attempt.

## You understand this module when you can answer

- Which bits did each mask preserve?
- Why is XOR reversible when the same mask is used twice?
- How do logical and arithmetic right shifts differ?
