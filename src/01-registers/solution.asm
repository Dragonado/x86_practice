global _start

section .data
    message      db   'register result: '
    digits       db   '24', 10
    message_len  equ  $ - message

section .text

_start:
    ; Rearrange the reversed digits using byte-sized registers.
    mov al, [digits]
    mov bl, [digits + 1]
    xchg al, bl
    mov [digits], al
    mov [digits + 1], bl

    ; write(1, message, message_len)
    mov eax, 4
    mov ebx, 1
    lea ecx, [message]
    mov edx, message_len
    int 0x80

    ; exit(0)
    mov eax, 1
    xor ebx, ebx
    int 0x80
