section .data
    msg db 10, "Hello, world!", 10   
    msglen equ $-msg                 

%macro print 2                       
    mov rax, 1                       
    mov rdi, 1                       
    mov rsi, %1                      
    mov rdx, %2                      
    syscall                          
%endmacro

%macro exit 0                        
    mov rax, 60                      
    xor rdi, 0                       
    syscall                          
%endmacro

section .text
    global _start
_start:
    print msg, msglen                
    exit                             
