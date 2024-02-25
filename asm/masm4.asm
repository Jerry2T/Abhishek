section .data
    bmsg db 10, "Please enter the 5 digit BCD number "
    bmsg_len equ $-bmsg
    ehmsg db 10, "Equivalent HEX number is "
    ehmsg_len equ $-ehmsg

section .bss
    buf resb 6
    char_ans resb 4
    ans resw 1

%macro exit 0
	mov rax,60
	mov rdi,0
	syscall
%endmacro

%macro print 2
	mov rax,1
	mov rdi,1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

%macro read 2
	mov rax,0
	mov rdi,0
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

section .text
	global _start 
_start:

    call bcd_hex
    exit 

    bcd_hex:
        print bmsg, bmsg_len
        read buf, 6   ;5 digit + 1enter key

        mov rsi, buf
        xor rax, rax
        mov rbp, 5
        mov rbx,10
        next:
        xor cx,cx
        mul bx
        mov cl, [rsi]
        sub cl, 30h
        add ax,cx
        
        inc rsi
        dec rbp
        jnz next
        mov [ans] , ax 
        print ehmsg, ehmsg_len
        mov ax, [ans]
        call display
        ret

    display:
        mov rbx,16
        mov rcx,4
        mov rsi, char_ans+3
        
        cnt:
        mov rdx,0
        div rbx
        cmp dl,09h
        jbe add30
        add dl, 07h

        add30: 
        add dl, 30h

        mov [rsi], dl
        dec rsi
        dec rcx
        jnz cnt
        print char_ans, 4
        ret