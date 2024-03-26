section .data
    pn db 10,"Positive nums: "
    pnl equ $-pn
    nn db 10,"Negative nums: "
    nnl equ $-nn
    arr dq -21h,5Fh,-33h,40h,55h
    n equ 5