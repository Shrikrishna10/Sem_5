.data
a: .byte 0x11, 0x12

.text
la x10, a
lbu x11, 0(x10)
lbu x12,1(x10)
bgt x11, x12, exit
# if this is simply for this q 
# only then we can do it directly using store functions
Loop:
    add x13,x13,x12
    mv x12 x0
    add x12 x11 x12
    mv x11 x0
    add x11 x11 x13
    mv x13 x0

exit:
sb x11, 0(x10)
sb x12, 1(x10)
