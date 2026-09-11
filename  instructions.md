It looks like the markdown didn't render correctly when you pasted it. This usually happens when the markdown is wrapped in an extra code block, or if the viewer doesn't support nested code blocks.

To fix this, copy the text inside the code block below and paste it into a blank file named PROJECT_BRIEF.md. Then, open that file in a markdown viewer (like VS Code with Markdown Preview, Obsidian, or GitHub) to see it properly formatted.

Here is the clean, ready-to-copy markdown file:

markdown
# Project: x86 32-bit Assembly Learning Harness & Curriculum for Apple Silicon Mac

**Audience:** An AI agent or developer tasked with creating a complete learning environment.

**User Profile:** Owner of an Apple Silicon (M1) MacBook Air. No prior x86 assembly experience. Wants to learn by compiling and testing code. Ultimate goal: understand and complete the labs in **CS6265: Information Security Lab** (Georgia Tech) — specifically Bomb Lab 1, Bomb Lab 2/Shellcode, and Stack Overflow.

**Constraint:** The host machine cannot natively execute x86 32-bit binaries. All compilation and execution must occur inside a Linux container that uses Rosetta 2 for x86/amd64 emulation via Docker Desktop.

---

## 1. The Harness: Docker-Based Build & Test Environment

### 1.1 Technical Requirements

- **Host:** macOS on Apple Silicon (M1/M2/M3).
- **Container Runtime:** Docker Desktop for Mac.
- **Emulation:** Enable **"Use Rosetta for x86/amd64 emulation"** in Docker Desktop → Settings → General.
- **Base Image:** `debian:bookworm-slim` with `--platform=linux/amd64`.
- **Installed Packages inside container:**
  - `nasm` (assembler)
  - `binutils` (linker, objdump)
  - `gcc-multilib` (for C interop and 32-bit libraries)
  - `gdb` (debugger)
  - `make`
  - `libc6-dev-i386`
- **Execution:** All assembly files are assembled with `nasm -f elf32`, linked with `ld -m elf_i386`, and run inside the container. The container runs as an x86_64 Linux environment via Rosetta, so 32-bit binaries execute natively (emulated).

### 1.2 Directory Structure (on host Mac)

```text
x86-harness-mac/
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── setup.sh
├── progress.sh
├── progress.md
├── README.md
├── src/
│   ├── 00-hello/
│   │   ├── README.md
│   │   ├── starter.asm
│   │   ├── solution.asm
│   │   └── test.sh
│   ├── 01-registers/
│   │   └── ...
│   └── ... (up to 23)
├── exercises/               # Optional: additional practice problems
└── tests/                   # Top-level test runner
1.3 Key Files
Dockerfile
dockerfile
FROM --platform=linux/amd64 debian:bookworm-slim

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    nasm \
    binutils \
    gcc-multilib \
    gdb \
    make \
    libc6-dev-i386 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
docker-compose.yml
yaml
version: '3.8'
services:
  x86-harness:
    build: .
    platform: linux/amd64
    volumes:
      - .:/workspace
    tty: true
    stdin_open: true
    command: /bin/bash
Makefile (host-side)
makefile
build:
	docker-compose build

shell:
	docker-compose run --rm x86-harness

# Usage: make run MODULE=00-hello
run:
	docker-compose run --rm x86-harness make -C src/$(MODULE) run

test:
	docker-compose run --rm x86-harness make -C tests all

test-module:
	docker-compose run --rm x86-harness make -C src/$(MODULE) test
setup.sh
Checks for Docker Desktop installation.

If not installed, prints instructions to download from https://www.docker.com/products/docker-desktop/.

Instructs user to enable Rosetta emulation in Docker Desktop settings.

Runs docker-compose build to build the image.

progress.sh (run on host Mac)
Accepts arguments: ./progress.sh <module_number> <status> <exercises_passed> <notes>

Appends a timestamped entry to progress.md in UTC.

Updates summary table (modules completed, exercises passed, streak).

Uses date -u +"%Y-%m-%d %H:%M:%S UTC".

2. Course Structure: 24 Modules
The curriculum is divided into three phases. Each module contains:

README.md — theory, annotated examples, external links.

starter.asm — incomplete code with TODO comments.

solution.asm — reference solution.

test.sh — compiles, runs, and verifies output.

Phase 1: Foundations (Modules 1–8)
What is Assembly? CPU architecture, registers (EAX–EDX, ESI, EDI, ESP, EBP, EIP, EFLAGS), fetch-decode-execute cycle.

Hello, World! write syscall (int 0x80), sections (.text, .data, .bss).

Registers Deep-Dive. MOV, LEA, XCHG, operand sizes (byte, word, dword).

Arithmetic. ADD, SUB, MUL, DIV, INC, DEC. EFLAGS (ZF, SF, OF, CF).

Logical & Bitwise. AND, OR, XOR, NOT, shifts and rotates.

Control Flow I. CMP, TEST, conditional jumps (JE, JNE, JG, JL, etc.), JMP.

Control Flow II. Loops with LOOP, manual loops with DEC/JNZ. Factorial, Fibonacci.

The Stack. PUSH, POP, CALL, RET. Stack frame, call/return mechanism.

Phase 2: Intermediate (Modules 9–16)
Functions & Calling Conventions. cdecl, parameter passing, return values, local variables, EBP-relative addressing.

String Operations. MOVS, CMPS, SCAS, STOS, LODS, REP prefixes. Implement strlen, strcpy, strcmp.

Arrays & Memory. Addressing modes (immediate, register, base+index, scaled index). Multi-dimensional arrays.

Reading Assembly from C. Compile C with gcc -m32 -S. Map if, for, while to jumps/loops.

GDB Basics. Breakpoints, info registers, x/ commands, disassemble. Debug a simple x86 binary.

Intro to Reverse Engineering. objdump -d -M intel, nm, reading disassembly to infer logic.

Structures & Unions. Memory layout, alignment, base+offset addressing.

System Calls Deep-Dive. int 0x80 vs sysenter. Linux 32-bit syscall table. open, read, write, close, exit.

Phase 3: Advanced — CS6265 Preparation (Modules 17–24)
Shellcode Fundamentals. Position-independent code, null-byte avoidance, execve("/bin/sh", NULL, NULL).

64-bit x86 (x86_64). Differences: RAX–R15, RIP-relative addressing, syscall, System V AMD64 ABI.

Stack Overflow Mechanics. Stack layout during function call. Overwriting return address. EIP control.

Writing Your First Exploit. Craft payload to overwrite EIP, redirect to shellcode. Use pwntools.

Bypassing Stack Protections. Stack canaries, NX/DEP, ASLR. __stack_chk_fail. Intro to ROP.

GDB for Exploitation. pwndbg or gef. checksec, vmmap, telescope. Attach to process.

Bomb Lab Techniques. Defuse a bomb binary with objdump and GDB. String comparison via strings and gdb. Multiple phases.

CS6265 Lab 3 Preview. Real vulnerable binary. Shellcode injection. End-to-end exploit.

3. Detailed Guide: How Much x86 to Learn for CS6265
This section explicitly maps the required x86 knowledge to the CS6265 labs. The goal is to ensure the learner knows exactly what depth is needed for each topic.

3.1 CS6265 Lab Overview
Bomb Lab 1: Reverse engineering a binary with multiple phases. Requires reading disassembly, understanding control flow, arithmetic, string comparison, and recursion.

Bomb Lab 2 / Shellcode: Writing and injecting shellcode. Requires knowledge of syscalls, position-independent code, and basic stack layout.

Stack Overflow (Lab 3): Exploiting a buffer overflow to hijack control flow. Requires deep understanding of the stack, function prologue/epilogue, return address, and payload crafting.

3.2 Required x86 Knowledge by Topic
Topic	Depth Needed	Modules
Registers	All general-purpose (EAX–EDX, ESI, EDI, ESP, EBP), EIP, EFLAGS. Know which are caller/callee-saved.	1, 3, 9
Instructions	MOV, LEA, ADD, SUB, MUL, DIV, CMP, TEST, JMP, JE/JNE/JG/JL, CALL, RET, PUSH, POP, AND, OR, XOR, SHL, SHR.	3–8
Stack	Push/pop, call/ret, stack frame layout (EBP, ESP), local variables, return address.	8, 9, 19
Calling Conventions	cdecl (32-bit), argument passing on stack, return value in EAX.	9
Strings	MOVS, CMPS, SCAS, REP prefixes. strlen, strcmp.	10
Memory Addressing	Immediate, register, base+index, scaled index. Array indexing.	11
Disassembly Reading	objdump -d -M intel, gdb disassemble. Recognize common patterns (loops, conditionals, function calls).	12–14, 23
GDB	Breakpoints, info registers, x/ examine memory, disassemble, stepi, nexti.	13, 22
Syscalls	int 0x80 table: read, write, open, close, execve, exit.	16, 17
Shellcode	Position-independent, null-byte free, execve("/bin/sh",0,0).	17
Stack Overflow	Buffer overflow, overwrite EIP, NOP sled, payload structure.	19, 20, 24
Protections	Stack canary, NX, ASLR. Basic bypass concepts.	21
ROP	Basic gadgets, chaining. (Optional for Lab 3 but useful.)	21
64-bit	Awareness of differences (for modern binaries).	18
3.3 Learning Outcomes
By the end of Module 24, the learner should be able to:

Read and understand x86 32-bit disassembly of a non-trivial binary.

Write position-independent shellcode for Linux x86.

Identify and exploit a simple stack buffer overflow.

Use GDB to inspect registers, memory, and control flow during exploitation.

Defuse a Bomb Lab binary by analyzing assembly and using GDB.

Understand the purpose of common binary protections and have a conceptual grasp of bypass techniques.

3.4 Not Required (But Helpful)
Floating-point (x87) and SIMD instructions.

Windows x86 calling conventions.

Advanced obfuscation or packing.

Kernel-level exploitation.

4. Deliverables
The agent must produce a complete, ready-to-use project containing:

Dockerfile and docker-compose.yml — container definitions.

setup.sh — guides user through Docker Desktop installation and Rosetta configuration.

Makefile — host-side targets: build, shell, run, test, test-module.

progress.sh — appends timestamped progress to progress.md.

README.md — full setup, usage, and troubleshooting for macOS.

All 24 module directories — each with README.md, starter.asm, solution.asm, test.sh.

progress.md — initial file with summary table and empty log.

tests/ — top-level test runner that runs all module tests.

4.1 Constraints
All assembly is x86 32-bit (except Module 18 which covers 64-bit differences).

Shell scripts must work on macOS (bash/zsh) and be POSIX-compliant where possible.

The harness must work on a fresh M1 Mac with only Docker Desktop installed.

No prior assembly knowledge assumed.

Every instruction in the modules must be explained.

The project must be self-contained; no external dependencies beyond Docker and the packages in the Dockerfile.

5. Getting Started (for the User)
Copy this entire markdown into a file named PROJECT_BRIEF.md.
