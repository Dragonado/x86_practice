global _start

section .data
    message      db   'bitwise result: '
    buffer       db   '00'
    message_len  equ  $ - message

section .text

_start:
    ; ---------------- 
    ; ENCODE 
    ; ---------------- 
    mov eax, 0xfe                       ; constraint
    xor eax, 0x5c                       ; constraint
    ror al, 4                           ; constraint 
    ; ---------------- 
    ; VALIDATE
    ; ---------------- 
    mov cl, al
    and cl, 0xf0
    cmp cl, 0x20
    jne failure
    mov cl, al
    and cl, 0x0f
    cmp cl, 0x0A
    jne failure
    ; ---------------- 
    ; PRINTING DIGITS
    ; ---------------- 
    xor edx, edx                        ; 0 the top half, eax already contains numerator
    mov ebx, 10                         ; need 10 to get digits division
    div ebx
    add [buffer], al                    ; al because we need to write exactly 1 byte (1st digit)
    add [buffer + 1], dl                ; dl becausewe need to write exactly 1 byte (2nd digit)
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, message_len
    int 0x80
    ; ---------------- 
    ; EXIT CLEANLY
    ; ---------------- 
    mov eax, 1                          ; exit
    xor ebx, ebx
    int 0x80
    ; ---------------- 
    ; BAD EXIT
    ; ---------------- 

    failure:
        mov eax, 1                      ; exit
        mov ebx, 1
        int 0x80
