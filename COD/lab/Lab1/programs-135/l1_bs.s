
.data
a: .byte 0x34, 0x23

.text
la x10, a
lb x11, 0(x10) # bringing data into register file
lb x12, 1(x10)
add x13, x11, x12
sh x13, 3(x10)