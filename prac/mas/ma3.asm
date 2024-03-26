section .data
    pn db 10,"Positive nums: "
    pnl equ $-pn
    nn db 10,"Negative nums: "
    nnl equ $-nn
    arr dq -21h,5Fh,-33h,40h,55h
    n equ 5

section .bss
    pcnt resq 1
    ncnt resq 1
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
    mov rsi,arr
    mov rcx,n
    mov rbx,0
    mov rdx,0       

nextnum:
    mov rax,[rsi]
    rol rax,1
    mov rax,1
    jc negative

positive:
    inc rbx
    jmp next

negative:
    inc rdx

next:
    add rsi,8
    dec rcx
    jnz nextnum

    mov [pcnt],rbx
    mov [ncnt],rdx
    Print pn,pnl
    mov rax,[pcnt]
    call display
    Print nn,nnl
    mov rax,[ncnt]
    call display
    exit
    
display:
    mov rbx,10
    mov rcx,2
    mov rsi,charans+1

cnt:
    mov rdx,0
    div rbx

    cmp dl,09h
    jbe add30
    add dl,07h

add30: add dl,30h

    mov [rsi],dl
    dec rsi
    dec rcx
    jnz cnt
    Print charans,2
    ret