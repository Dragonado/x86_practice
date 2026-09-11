global _start

section .data
    message db 'bomb phase: defused', 10
    message_len equ $ - message

section .text
_start:
    mov eax, 4              ; write
    mov ebx, 1              ; stdout
    mov ecx, message
    mov edx, message_len
    int 0x80
    mov eax, 1              ; exit
    xor ebx, ebx
    int 0x80

