section .data
    num1 dd 2                ; First number
    num2 dd 3                ; Second number

    result dd 0              ; Variable to store the result
    format db 'Result: %d', 10 ; Format string for printing

section .text
    global _start

_start:
    ; Addition
    mov rax, [num1]
    add rax, [num2]
    mov [result], rax

    ; Print result
    mov rdi, 1           ; file descriptor 1 is stdout
    mov rsi, result      ; pointer to the result variable
    mov rax, 1           ; syscall number for sys_write
    mov rdx, 11          ; length of the result string
    syscall              ; invoke syscall

    ; sys_exit(status)
    mov rax, 60          ; syscall number for sys_exit
    xor rdi, rdi         ; exit status 0
    syscall              ; invoke syscall
