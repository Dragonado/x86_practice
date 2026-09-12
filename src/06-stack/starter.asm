global _start

section .data
    message      db   'stack value: '
    answer       db   '00'
    message_len  equ  $ - message

section .text

_start:
    ; ---------------- 
    ; PUSH 23 and 19 to stack
    ; ---------------- 
    sub esp, 2
    mov word[esp], 23
    sub esp, 2
    mov word[esp], 19
    ; ---------------- 
    ; POP AND ADD
    ; ---------------- 
    xor eax, eax
    add ax, word[esp]
    add esp, 2
    add ax, word[esp]
    add esp, 2

    ; ---------------- 
    ; WRITE TO BUFFER 
    ; ---------------- 

    xor edx, edx
    mov ecx, 10
    div ecx
    add edx, '0'
    add eax, '0'
    mov [answer], al
    mov [answer + 1], dl

    ; ---------------- 
    ; PRINT AND EXIT
    ; ---------------- 

    mov eax, 4                          ; write
    mov ebx, 1                          ; stdout
    mov ecx, message
    mov edx, message_len
    int 0x80
    mov eax, 1                          ; exit
    xor ebx, ebx
    int 0x80
