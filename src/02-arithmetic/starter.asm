global _start

section .data
    message      db   'arithmetic result: '
    message_len  equ  $ - message
    zero         db   '0'
    buf          db   '00'

section .text

_start:
    mov eax, 4                          ; write
    mov ebx, 1                          ; stdout
    mov ecx, message
    mov edx, message_len
    int 0x80
    ; ------------------------
    mov eax, 1                          ; input 1
    mov ebx, 20                         ; input 2
    xor ecx, ecx                        ; result
    add ecx, eax                        ; 1
    add ecx, ebx                        ; 21
    add ecx, ecx                        ; 42

    xor edx, edx                        ; setting to 0
    mov eax, ecx                        ; EDX:EAX is now 42
    mov ecx, 10                         ; divisor is 10
    div ecx                             ; divide, eax has quotient, edx has remainder

    add al, [zero]                      ; add '0' to make it ASCII
    add dl, [zero]                      ; add '0' to make it ASCII
    mov [buf], al                       ; ovewrite 0 with 4
    mov [buf + 1], dl                   ; ovewrite 0 with 2
    mov ecx, buf                        ; buffer pointer to ecx
    mov edx, 2                          ; length of buffer
    mov eax, 4                          ; write syscall
    mov ebx, 1                          ; stdout
    int 0x80                            ; interrupt
    ; ------------------------
    mov eax, 1                          ; exit
    xor ebx, ebx
    int 0x80
