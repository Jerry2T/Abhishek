section .data
    msg db 10, "Hello, world!", 10   ; Define a string with newline characters at the beginning and end
    msglen equ $-msg                 ; Calculate the length of the string

%macro print 2                       ; Macro for printing to stdout
    mov rax, 1                       ; System call number for sys_write
    mov rdi, 1                       ; File descriptor 1 is stdout
    mov rsi, %1                      ; Address of the string to be printed
    mov rdx, %2                      ; Length of the string
    syscall                          ; Invoke the system call
%endmacro

%macro exit 0                        ; Macro for program exit
    mov rax, 60                      ; System call number for sys_exit
    xor rdi, 0                       ; Exit code 0
    syscall                          ; Invoke the system call
%endmacro

section .text
    global _start
_start:
    print msg, msglen                ; Print the string
    exit                             ; Exit the program
