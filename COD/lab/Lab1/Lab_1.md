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
sw x13, 8(x10)

## Statement: - Write an Assembly Program for addition of 2 halfwords

.data
a: .half 0x1234, 0x0123

.text
la x10, a
lh x11, 0(x10) # bringing data into register file
lh x12, 2(x10)
add x13, x11, x12
sh x13, 4(x10)

## Statement: - Write an Assembly Program for addition of 2 bytes

.data
a: .byte 0x34, 0x23

.text
la x10, a
lb x11, 0(x10) # bringing data into register file
lb x12, 1(x10)
add x13, x11, x12
sh x13, 3(x10)

## Statement: - Write an Assembly Program and analyse the format of storing signed and unsigned words, half words and byte data types

```` asm
.data
a: .half 0x1234, 0x8123

.text
la x10, a
lhu x11, 0(x10) # half words are stored as signed by default
lhu x12, 2(x10)

#lb x11, 0(x10) # this is for bytes which follow the same format as halfword
#lb x11, 0(x10) 

#lh x11, 0(x10) # this is for signed half words 
#lh x11, 0(x10) 

#lw x11, 0(x10) # this is for words where there is no space for signed extentions
#lw x11, 0(x10)

add x13, x11, x12
sh x13, 4(x10)
```

