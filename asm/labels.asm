section .data
    text1 db "what is your name:"
    textlen equ $-text1

    text2 db "Hello,"
    leng equ $-text2

section .bss
    name resb 16

section .text
    global _start

_start:
    call _print1
    call getname
    call print2
    call names;
    
    mov rax,60
    mov rdi,0
    syscall


_print1:
    mov rax,1
    mov rdi,1
    mov rsi,text1
    mov rdx,19
    syscall
    ret

print2:
    mov rax,1
    mov rdi,1
    mov rsi,text2
    mov rdx,7
    syscall
    ret

names:
    mov rax,1
    mov rdi,1
    mov rsi,name
    mov rdx,16
    syscall
    ret

getname:
    mov rax,0
    mov rdi,0
    mov rsi,name
    mov rdx,16
    syscall
    ret