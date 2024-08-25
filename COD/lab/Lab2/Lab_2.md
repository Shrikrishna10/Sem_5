slt -> set less than
for unsigned sltu -> set less than unsigned
this is the method for the carry add
in risc-v we figure out if there is a carry using the command above 
the idea is that we will compare one of the numbers that we are adding with the result that we generate
we want the slt to set the destination register to one if the number is greater than the 


> [! Question]
> Write a code to add two 32 bit numbers using RV32I and store the resulting memory along with the carry status
> ```  asm
> 
>.data
>a: .word 0x00001234, 0x90000123
>
>.text
>la x10, a
>lw x11, 0(x10) # bringing data into register file
>lw x12, 4(x10)
>add x13, x11, x12
>sltu x14, x13, x12
>sw x13, 16(x10)
>```


>[!Question]
>
Write a code to add two 64 bit numbers using RV32I and store the resulting memory along with the carry status
