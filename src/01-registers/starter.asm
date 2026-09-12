global _start

section .data
    message      db   'register result: '
    message_len  equ  $ - message
    number       db   '24'

section .text

_start:

    ; PRINT 'register result: '
    mov eax, 4                          ; write
    mov ebx, 1                          ; stdout
    mov ecx, message
    mov edx, message_len
    int 0x80
    ;  --------------------
    mov al, [number]
    mov bl, [number + 1]
    xchg al, bl
    mov [number], al
    mov [number + 1], bl
    mov eax, 4
    mov ebx, 1
    mov ecx, number
    mov edx, 2
    int 0x80
    ;  --------------------
    ; EXIT PROGRAM
    mov eax, 1                          ; exit
    xor ebx, ebx
    int 0x80
