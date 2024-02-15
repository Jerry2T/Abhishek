section .data
    bmsg db 10,"Enter Bcd Num: "
    bml equ $-bmsg
    ehmg db 10,"Hex num: "
    ehml equ $-ehmg
    
section .bss
    buf resb 6
    charans resb 4
    ans resw 1

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
    Print bmsg,bml
    Read buf,6
    mov rsi,buf
    xor ax,ax
    mov rbp,5
    mov rbx,10

next:
    mul bx
    mov cl,[rsi]
    sub cl,30h
    add ax,cx

    inc rsi
    dec rbp
    jnz next
    mov [ans],ax

    Print ehmg,ehml
    mov ax,[ans]
    call display
    exit


display:
    mov rbx,16
    mov rcx,2
    mov rsi,charans+3

cnt:
    xor rdx,rdx
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