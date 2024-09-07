# Instruction for Making Decisions

the instruction is similar to an **if statement with a go-to.**
## Conditional Branches:
A instruction that tests a value & that allows for a subsequent transfer of control to a new address in the program based on the outcome of the test.
![[Pasted image 20240829105505.png]]

#### Question
In the following code segment, f, g, h, i, and j are variables. If the five
variables f through j correspond to the five registers x19 through x23,
what is the compiled RISC-V code for this C if statement?
if (i == j) f = g + h; else f = g − h;
![[Pasted image 20240829114557.png]]
here we need to compare i & j and make decisions on the opposite outcome since we can jump to else if the condition is not meet

#### Question
Loops : for iterating a computation
Here is a traditional loop in C:
while (save[i] == k)
i += 1;
Assume that i and k correspond to registers x22 and x24 and the base of
the array save is in x25. What is the RISC-V assembly code corresponding
to this C code?
![[Pasted image 20240829120356.png]]

=======
signed 13-bits are stored in 12 bits how? #search #todo #important 

## Addressing in Branches
- RISC-v branch instructions use an RISC-v instruction format with a 12-bit immediate. This format can represent branch addresses from -4096 to 4094, in multiples of 2 as it is only possible to branch to even addresses.
bne x10, x11, 2000 ; rs1=x10, rs2= x11 & imm[12:0] = 0x7D0= 0 0111 1101 000 ==0==
the above instruction 


#important 
>[!Note]
>Opcode is indicating the subclass of instruction
>11 000 11 for all branches 
>the func3 tells us what the condition is be it bne or blt or so on

>[!Note]
>func3 is needed for subclass
>func7 is neeeded only when we hv subi

#important signed offset is the only 13 bit immediate value.
#important 
>[!Question] 
>Here is a traditional loop in C 
>while(save[i] == k)
>i+=1;
>assume that i and k correspond to register x22 & x24 & the base of the array save is in x25. What is the RISC-V assembly code corresponding to this C code? 
>If we assume that we place the loop at starting at code memory location 0x80000 in memory, what is the RISC-V machine code for this loop

>[!Solution]
>Compiled RISC-V assembler code:
>```
>loop:
>slli x10, x22, 2 # temp reg x10 =i*4
>add x10, x10, x25 # x10 = address of save[i]
>lw x9, 0(x10) # temp reg x9 =save[i]
>bne n9, x24, Exit # go to Exit if save[i] !=k
>addi x22, x22, 1 # i+=1
>beq x0, x0, loop # go to loop
>Exit:
>
>```


#HW Find encoding of branch on less than unsigned x13, x11, -16 #search 

#HW Write a program to translate the given C statement to assembly
for(i=0;i<10; i++)
{ c[i] = a[i] +b[i]}
