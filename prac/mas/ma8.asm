section .data
    nline db 10,10
    nlen equ $-nline
    colon db ":"
    rmsg db 10,"Processor is in Real Mode"
    rmsglen equ $-rmsg
    pmsg db 10,"Processor is in Protected Mode"
    pmsglen equ $-pmsg
    gmsg db 10,"GDTR"
    gmsgl equ $-gmsg
    imsg db 10,"IDTR"
    imsgl equ $-imsg
    lmsg db 10,"LDTR"
    lmsgl equ $-lmsg
    tmsg db 10,"TR"
    tmsgl equ $-tmsg
    mmsg db 10,"Machine Status Word"
    mmsgl equ $-mmsg

section .bss
    charans resb 4
    GDTR resw 3
    IDTR resw 3
    LDTR resw 1
    MSW resw 1
    TR resw 1

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
    SMSW [MSW]
    mov rax,[MSW]
    ror rax,1
    jc p_mode
    Print rmsg,rmsglen
    jmp next
p_mode: 
    Print pmsg,pmsglen
next: 
    SGDT [GDTR]
    SIDT [IDTR]
    SLDT [LDTR]
    STR  [TR]
    SMSW  [MSW]   
    
    Print gmsg,gmsgl    
    mov ax,[GDTR+4]
    call display
    mov ax,[GDTR+2]
    call display
    Print colon,1
    mov ax,[GDTR+0]
    call display

    Print imsg,imsgl    
    mov ax,[IDTR+4]
    call display
    mov ax,[IDTR+2]
    call display
    Print colon,1
    mov ax,[IDTR+0]
    call display

    Print lmsg,lmsgl    
    mov ax,[LDTR]
    call display
    Print tmsg,tmsgl
    mov ax,[TR]
    call display
    Print mmsg,mmsgl
    mov ax,[MSW]
    call display

    Print nline,nlen
    exit

display:
    mov rbx,16
    mov rcx,4
    mov rsi,charans+3
cnt:
    mov rdx,0
    div rbx
    cmp dl,09h
    jbe add30
    add dl,07h
add30: add dl,30h
    mov [rsi],dl
    dec rsi
    dec rcx
    jnz cnt
    Print charans,4
    ret