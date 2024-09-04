.data
a: .byte 0x12

.text
la x10,a
lb x11,  0(x10)  #x11=0x12
andi x12,x11,0xE0  # and x12 ,0xE0
bne x12,x0,exit
addi x22,x0,5
back:andi x12,x11,0x01

    beq x12,x0,next
next:srli x11,x11,1
    addi x22,x22,-1
    bne x22,x0,back
exit:
    addi x15,x0,0x00