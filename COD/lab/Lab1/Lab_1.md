#lab
# Program 1:
## Statement: - Write an Assembly Program for addition of 2 words
.data
a: .word 0x80001234, 0x90000123

.text
la x10, a
lw x11, 0(x10) # bringing data into register file
lw x12, 4(x10)
add x13, x11, x12
sw x13, 12(x10)
