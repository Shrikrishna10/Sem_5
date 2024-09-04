 Write a Machine code:
- check if a given 8 bit number is a 2 out of 5 code
- for most significant 3 bits must be 0
- in the least significant 5 bits, there must only be 2 1's

 assume there are 2 elements in the memory as a[0] and  a[1]  if a [0] is lesser than a[1] swap the elements  

arrange an array in ascending order using bubble sort

.data
a: .byte 0x11, 0x12, 0x02, 0x15, 0x13

.text
la x10, a
addi x15,x15, 0
addi x16,x16, 5
// if this is simply for this q only then we can do it directly using store functions
Loop:
lbu x11, 0(x10)
lbu x12,1(x10)
add x13,x13,x12
mv x12 x0
add x12 x11 x12
mv x11 x0
add x11 x11 x13
mv x13 x0
addi x15,x15, 1
bne x15, x16, exit

exit:
sb x11, 0(x20)
sb x12, 1(x20)
addi x10, x10, 1
blt x11, x12, Loop