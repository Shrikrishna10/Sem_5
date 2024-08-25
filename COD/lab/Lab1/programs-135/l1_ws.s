.data
a: .word 0x80001234, 0x00000123

.text
la x10, a
lw x11, 0(x10) # bringing data into register file
lw x12, 4(x10)
add x13, x11, x12
sw x13, 8(x10)