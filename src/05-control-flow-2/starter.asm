global _start

section .data
    message      db   'loop sum: '
    answer       db   '00'
    message_len  equ  $ - message

section .text

_start:
    xor eax, eax
    mov ebx, 1
    ; ---------------- 
    ; LOOP FOR 10 ITERATIONS
    ; ---------------- 

    sum_loop:
        add eax, ebx
        add ebx, 1
        cmp ebx, 11
        jne sum_loop
    ; ---------------- 
    ; WRITE TO BUFFER 
    ; ---------------- 

    after_loop:
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

    print:
        mov eax, 4                      ; write
        mov ebx, 1                      ; stdout
        mov ecx, message
        mov edx, message_len
        int 0x80
        mov eax, 1                      ; exit
        xor ebx, ebx
        int 0x80
