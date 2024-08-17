.data
a: .half 0x8000, 0x0001

.text
la x10, a
lh x11, 0(x10) #bringing data into register file
lhu x12, 2(x10)
add x13, x11, x12
sh x13, 4(x10)