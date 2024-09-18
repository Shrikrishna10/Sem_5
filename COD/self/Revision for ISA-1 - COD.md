# C to RISC-v Asm

## Question 1
Assume that the variable f, g, h, i & j are assigned to register x5, x6, x7, x28 & x29, respectively. Assume that the base address of the arrays A & B are in register x10 & x11, respectively. Assume data of double word type.
B[g] = A[f] + A[f+1];

### Solution
-> for this we will use the slli to move through the array with a temporary register and use this code below 
```asm
slli x30 x5 3 # since it is a double word we multiply with 8 - 2^3 
add x25 x10 x30 # this is to get the base address of the offset
ld x12 0(x25) # x12 = a[f]
ld x13 8(x25) # x13 = a[f+1]
add x14 x12 x13 # x14 = a[f] + a[f+1]
alli x28, x6, 3 # for base address of g
add x29, x11, x28
sd x14 0(x29)
```


## Question 2
For the following C statements write a minimal sequence of RISC-V asm instructions that performs the indentical operations. Assume x6=A & x17 Base address of C
A = C[0] << 4;

### Solution
this is minimal code so 2 lines should suffice
```asm
ld x10 0(x17)
slli x6 x10 4
```
here we dont need a load n store instruction 
we only need the load operation n we hv the base address and it is only offset of 0.

## Question 3
Here is a C statement:
B[i] = (A[1]/8)+1;
Assume that i corresponds to registers x22, the base of array A is in x25 & the base of array B is in x26. What is the RISC-v asm code corresponding to this C code?
Note: Data type is unsigned 16-bits values.

### Solution
```asm
slli x10, x22. 1
add x12 x25 x10 # avoid using same registers to update the destinations
lhu x11, 0(x10)
srli x24 x10 3
add x24 x24 x22

```
#todo 

# TO-DO
- [ ] Need to figure out how to convert to machine code
- [ ] need to Figure out how to read machine code 
- [ ] understand the sizes of data shit in arrays.
- [ ] need to understand how the 32 bits are stored in those 12 bit spaces

# Recursion
nested subroutines 
