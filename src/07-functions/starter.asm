global _start

section .data
    message      db   'function result: '
    answer       db   '00'
    message_len  equ  $ - message

section .text

function_add:
    pop ecx                             ;  save return address
    xor eax, eax
    xor ebx, ebx
    pop eax
    pop ebx
    add eax, ebx
    push ecx
    ret

_start:
    ; ---------------- 
    ; PUSH 23 and 19 to stack
    ; ---------------- 
    push 23
    push 19
    call function_add

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
