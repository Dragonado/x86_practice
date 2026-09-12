global _start

section .data
    message      db   'mode: x86-64', 10
    message_len  equ  $ - message

section .text

_start:
    mov eax, 1                          ; write
    mov edi, 1                          ; stdout
    lea rsi, [rel message]
    mov edx, message_len
    syscall
    mov eax, 60                         ; exit
    xor edi, edi
    syscall
