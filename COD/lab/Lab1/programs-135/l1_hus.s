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