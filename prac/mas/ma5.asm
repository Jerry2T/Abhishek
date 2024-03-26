section .data
    msg db 10,"Enter 5 digit no: "
    ml equ $-msg
    op db 10,"Output: "
    ol equ $-op

section .bss
    charans resb 2

%macro Print 2
    mov rax,1
    mov rdi,1
    mov rsi,%1
    mov rdx,%2
    syscall    
%endmacro

%macro Read 2
    mov rax,0
    mov rdi,0
    mov rsi,%1
    mov rdx,%2
    syscall    
%endmacro

%macro exit 0
    mov rax,60
    mov rdi,0    
    syscall    
%endmacro

section .text
    global _start
_start:
    call bcd_hex
    exit

bcd_hex:

next:
    

display:
    mov rbx,10
    mov rcx,2
    mov rsi,charans+1

cnt: mov rdx,0
     div rbx

     cmp dl,09h
     jbe add30
     add dl,07h

add30: add dl,30h

    mov [rsi],dl
    dec rsi
    dec rcx
    Print charans,2
    ret