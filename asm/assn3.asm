section .data
	mes db 10,"Enter the string: "
	mesl equ $ -mes

	sms db 10,"String length: "
	smsl equ $ -sms

section .bss
    string resb 50
    string2 equ $ -string
    count resb 1
	charans resb 2

%macro Print 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro

%macro read 2
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
    Print mes,mesl
    read string,string2
    mov [count],rax
    Print sms,smsl
	mov rax,[count]
    dec rax
	call display
	exit

display:
    mov rbx,10
    mov rcx,2
    mov rsi,charans+1

back:
    mov rdx,0
    div rbx ;rax,rbx

    cmp dl,09h
    jbe add30
    add dl,07h
add30:
    add dl,30h

    mov [rsi],dl
    dec rsi
    dec rcx
    jnz back

    Print charans,2
    ret
