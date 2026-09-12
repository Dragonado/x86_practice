global _start

section .data
    buffer              db   '0000'
    equal_string        db   'branch: equal'
    equal_string_len    equ  $ - equal_string
    unequal_string      db   'branch: unequal'
    unequal_string_len  equ  $ - unequal_string

section .text

_start:
    ; ---------------- 
    ; READ FROM INPUT 
    ; ---------------- 
    mov eax, 3                          ; read
    mov ebx, 0                          ; stdin
    mov ecx, buffer                     ; input buffer
    mov edx, 3                          ; read 3 bytes
    int 0x80

    ; ---------------- 
    ; LOAD DATA FROM INPUT BUFFER 
    ; ---------------- 
    mov al, [buffer]
    mov bl, [buffer + 2]

    ; ---------------- 
    ; Conditional jump 
    ; ---------------- 
    cmp al, bl
    jne unequal

    ; ---------------- 
    ; PRINT EQUAL AND EXIT 
    ; ---------------- 
    mov eax, 4                          ; write
    mov ebx, 1                          ; stdout
    mov ecx, equal_string               ; 
    mov edx, equal_string_len           ; 
    int 0x80
    mov eax, 1                          ; exit
    xor ebx, ebx
    int 0x80

    ; ---------------- 
    ; PRINT UNEQUAL AND EXIT 
    ; ---------------- 

    unequal:
        mov eax, 4                      ; write
        mov ebx, 1                      ; stdout
        mov ecx, unequal_string         ; 
        mov edx, unequal_string_len     ; 
        int 0x80
        mov eax, 1                      ; exit
        xor ebx, ebx
        int 0x80
