section .data
bmsg db 10,"Before Transfer: "
bmsg_len equ $-bmsg

amsg db 10,"After Transfer: "
amsg_len equ $-amsg

smsg db 10,"Source block: "
smsg_len equ $-smsg

dmsg db 10,"Destination block: "
dmsg_len equ $-dmsg

sblock  db 11h,22h,33h,44h,55h
dblock times 5 db 0
section .bss
char_ans resb 2


section .text
global _start

start:
Print bmsg,bmsg_len

Print smsg,smsg_len
mov rsi,sblock
call disp_block

Print dmsg,dmsg_len
mov rsi,sblock
call disp_block

call BT_NO

Print bmsg,bmsg_len

Print smsg,smsg_len
mov rsi,sblock
call disp_block

Print dmsg,dmsg_len
mov rsi,sblock
call disp_block

BT_NO:
mov rsi,sblock
mov dsi,dblock
mov rcx,5

back:   mov al,[rsi]
mov [rdi],al
inc rsi
inc rdi
dec rcx
jnz back
ret

disp_block:
mov rbp,5

next_num:
mov al,[rsi]
push rsi

call disp_8
Print space,1

pop rsi
inc rsi

dec rbp
jnz next_num
 ret
 
 disp_8:
  mov rsi,char_ans+1