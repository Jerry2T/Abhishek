section .data
	space db " "
	bsmg db 10,"B4 transfer:"
	bll equ $-bsmg
	asmg db 10,"After transfer:"
	all equ $-asmg
	smg db 10,"Sblock:"
	sll equ $-smg
	dsmg db 10,"Dblock:"
	dll equ $-dsmg
	sblock db 11h,22h,33h,44h,55h
	dblock times 5 db 0
	
section .bss
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
	Print bsmg,bll
	Print smg,sll
	mov rsi, sblock
	call dispblock
	
	Print dsmg,dll
	mov rsi, dblock-2
	call dispblock
	
	call BT_O
	Print asmg,all
	Print smg,sll
	mov rsi, sblock
	call dispblock
	
	Print dsmg,dll
	mov rsi, dblock-2
	call dispblock
	exit
	
BT_O:
	mov rsi,sblock+4
	mov rdi,dblock+2
	mov rcx,5
	
	STD
	REP MOVSB
	ret

dispblock:
	mov rbp,5
nextnum:
	mov al,[rsi]
	push rsi
	call disp
	Print space,1
	
	pop rsi
	inc rsi
	dec rbp
	jnz nextnum
	ret
	
disp:
	mov rsi,charans+1
	mov rcx,2
	mov rbx,16
nextdigit:
	xor rdx,rdx
	div rbx
	cmp dl,9h
	jbe add30
	add dl,07h
add30: add dl,30h
	mov [rsi],dl
	dec rsi
	dec rcx
	jnz nextdigit
	Print charans,2
	ret