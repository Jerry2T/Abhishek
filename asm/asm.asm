section .data
    nline db 10,10
    nline_len equ $-nline

    ano db 10," Assignment no. 1 ",10
    db "Positive and Negative elements from 64-bit array", 10 
    ano_len equ $-ano

    arr64 dq -20, 30, -40, 50, -60
    n equ 5
    pmsg db 10,10,"Total number of positive elements : "
    pmsg_len equ $-pmsg

    nmsg db 10,10,"Total number of negative: "
    nmsg_len equ $-nmsg

Section .bss
    p_count resq 1 
    n_count resq 1 
    char_ans resb 2

%macro Print 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro Exit 0
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro

section .text
        Global _start
_start:
    Print ano, ano_len
    mov rsi, arr64 
    mov rcx, n
    mov rbx,0
    mov rdx,0

next_num:
    mov rax,[rsi] 
    Rol rax,1 
    jc negative

positive:
    inc rbx 
    jmp next

negative:
    inc rdx 

next:
    add rsi, 8 
    dec rcx
    jnz next_num
    mov [p_count], rbx 
    mov [n_count], rdx 
    Print pmsg, pmsg_len
    mov rax,[p_count] 
    call disp64_proc 
    Print nmsg, nmsg_len
    mov rax,[n_count] 
    call disp64_proc 
    Print nline, nline_len
    Exit
disp64_proc:
    mov rbx, 16 
    mov rcx,2 
    mov rsi,char_ans+1 
    cnt: mov rdx,0 
    div rbx
    cmp dl, 09h 
    jbe add30
    add dl, 07h 

add30:
    add dl,30h 
    mov [rsi],dl 
    dec rsi 
    dec rcx 
    jnz cnt 
    Print char_ans,2 
    ret
