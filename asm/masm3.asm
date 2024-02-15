section .data
    arr64 dq -21h, 5Fh, -33h, 40h, 55h
    n equ 5
    pmsg db 10,"Positive nums: "
    pml equ $-pmsg
    nmsg db 10,"Negative nums: "
    nml equ $-nmsg

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
    mov rsi,arr64
    mov rcx,n
    mov rbx,0
    mov rdx,0

next_num:
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
    jnz next_num

    mov [pcnt],rbx
    mov [ncnt],rdx
    Print pmsg,pml
    mov rax,[pcnt]
    call display
    Print nmsg,nml
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
add30:
    add dl,30h

    mov [rsi],dl
    dec rsi
    dec rcx
    jnz cnt

    Print charans,2
    ret