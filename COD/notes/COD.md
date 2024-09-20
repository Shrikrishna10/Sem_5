https://www.cs.sfu.ca/~ashriram/Courses/CS295/assets/books/HandP_RISCV.pdf -> Textbk
# How load-store Architecture works
Instructions provide 2 information:
- Fields like opcode, fun3, fun7 define the type & operation to be performed
- Fields which can identify the destination and source operands.
	->Destination operand is:
		- Register
		- Data memory depending on type of instruction
	->  Source operand is:
		- Register
		- Data memory
		- Immediate value /  constant

*
in operations like add the instruction has the destination operand as a register, 
in the store instruction the destination operand is a data memory
*

 ***Immediate Value is used as source #2 operand***

>[!Note]
>Don't add the values of the register with it self to make it 0 or anything that is a bad habit since you never know what is in it especially if all you want is to add a immediate value to it. Add the register as 
>```
>addi rd, x0, imm
>```


# Operands of the Computer Hw
## Operand Location: *physical location in the computer*

- Registers - Special locations built directly in Hw
- Memory Operands
- Constants (also called immediate)


	- byte addressable
		-  this is used to make sure that your processor is capable of supporting all data-types
	- word addressable / double word addressable
		- accessing the 32-bits, this means that the only the *word and double word data-type are supported*  

## Operand Location: Physical location in computer:
### Register: Special Location built directly in HW
- Programming language have simple variables that contain single/few data elements
- Operands in arithmetic instruction must be limited number of special locations
-  Registers can be used with either name(i.e. ra, zero) or x0, x1, etc. Using name is prefered
- Registers used for Specific purposes:
	- Zero Register: always holds the constant value 0.
	- Saved Registers s0-s11: used to hold variables.
	- Temporary Registers t0-t6: Used to hold intermediate values during a larger computation
	- Function arguments/ Return values 
	- Pointers: Stack, Global, Thread.

**RV32 & RV64 both have the same number of instructions, the difference lies in the size of the registers**



-Why can't you have more number of registers? Why is there a limited number of registers?\
	- this is kept small to increase the speed of the system 
	- Register are the fastest storage options and they are the closest to the proccessor
	- *Design Principle 1:* Simplicity favours Regulaity
	- *Design Principle 2:* Smaller is Faster.
	- The number of bits it would take in the instruction format to address a register is disadvantageous when there are a large number of registers
	- A very large number of registers may increase the clock cycle time simply because it takes electronic signals longer time when they must travel farther.

The RISC-V convention is x followed by the number of the register, except for a few register names that we will cover later.

### Identify the number of extra bits required to encode 128 registers instead of 32 registers in R-type instructions of RISC-V?
- 38
- 6 -> This is the correct answer for the above question as it asks for the extra bits 
- 8
- 32
### What will be the total number of encoding bits required (size of instruction bit) if the number of register increases from 32 to 128?
- 38 -> this is the correct answer
- 6
- 8
- 32
## Assembler Directives 
.text: A read-only section containing the actual instructions of the program.
- This portion of the object file or virtual address space also known as the code segment or simply the text segment of the program
- -> Anything under the .text file is known as the code segment.

.data: It is the read-write portion of the object file which contains data for the variables of the program
- this is a compulsory section.
-> The space to define the variables is under this. It contains the initialised static variables.
Eg:
a: .word 0x123445356, 0x23400005, 0x1234576543 -> *this can be either one element or can be an array of elements.*

.HALF: The .HALF directive for naturally aligned 2-byte or 16-bit comma separated words.
- The directive initialises the specified value to 2-bytes or 16-bits aligned integers
- it can also store multiple comma separated values. The operands specified can be decimal, hex, binary or character constants, but not labels. 

Similarly, .byte, .word, .dword can be used to initialise the specified values to 1-byte, 4-bytes, & 8-bytes respectively.

Eg:
`.text
`la  x10, a     // -> this is a pseudo instruction 
The above will load the starting address of a to the x10
`lw x11, 0 (x10)
After the execution of the above x11 will update with the 1st # from the x10 array? in the lil indian format
`lw x12, 4 (x10)
Note: it is better to convert hexadecimal values and then add in the formula below as one of the values will be in the hexadecimal format.
Physical Address: PA = BA + offset
				BA-> base address
x0 shouldn't be used as destination register as it is hardwired to ground.
.text
la  x10, a     // -> this is a pseudo instruction 
`add x13, x11, x12`
the above will the values of in x11 and x12 and the destination register as x13
`sw x13, 8(x10)`
the above store function will take the source first and then the next will be the offset value outside the bracket followed by the destination address in the or the base address??

Little Indian -> the data is stored in such a way that the LSB takes the 1st address position

Big Indian -> the data is stored in such a way that the MSB takes the 1st address position



## How RISC-V represent & access such large structures?
lw rd,imm12(rs1)
Eg: `lw x9,4 (x22)` 

loading word from memory into registers 

Src Operands

### Data transfer instructions
- byte, half word, word, double word
- unsigned no.s / signed no.s
Eg:
`.data`
`a: .word 0x12345678`
whenever we represent sign numbers, say a 4 bit number with larger formats like word or double the sign bit is copied to the remaining places 

All arithmetic instructions deals with registers only
-x0 is hardwired to ground

### R-type
add & subtract instructions 
### I-Type
most load instructions come under the I-Type
I can call an instruction of I-type if & only if it has
- rd,
- rs1 and 
- immediate 12-bit signed nu. 
as its operands.
*Eg:* `addi rd, rs1, imm`
There is no exclusive subi instruction in riscv 
# Representing Instructions in the Computer
## How do we represent Instructions?
- An assembler string like "add x10, x11, ,x12" is meaningless to hw as hw can understand only machine code
-Risc-v seeks simplicity: Since data is in words, make instructions of the same 32-bit words. Risc-v seeks simplicity, so define 6 basic types of instructions formats.
	- R-format: For register- register arithmetic operations
	- I-format: For register-immediate arithmetic operations & loads
	- S-format: For stores
	- B-format: for branches (a minor variant of U-format)
	- U-format:
	- J-format:



# How different types are encoded
## Regularity in instruction Encoding:
- Position of operands in the positions if the field is needed in a instruction format.
- There is a sort of symmetry or regularity maintained in these formats;
- the op code field is fixed and is always present 
- Eg: Op code is in bit position [6:0], fun3 [14: 12] & so on.
![[Pasted image 20240821110036.png]]
### opcode: 
- 7-bit
- partially specifies which of the 6 types of instruction formats.
- For R-type: 01  | 100 | 11
- it tells what the sub-class of instruction which is being decoded
- it has 3 fields:
	- the last 11 is the one that says what we are using in terms of extensions here it is saying that it is G extension

>[!Question]
>Find the binary encodings for the instruction



| type | instruction            | syntax                   |
| ---- | ---------------------- | ------------------------ |
| R    | rd, rs1, rs2           | add rd, rs1, rs2         |
| I    | rd, rs1, imm2 (signed) | lw rd, imr<br>add rd, rs |
| S    | rs1, rs2, imm          | sw rs2, im<br>           |

How R-format instruction are encoded?
We group in four bits and then convert it to hexadecimal

sub i is not intentionally included in the isa

>[!Question]
>find the encoding of lb x10, 32(x12)
> format is lb rd, imm12(rs1)
> 
> find encoding of xor x15, x22, x27
> slti x12, x13, x15
> lw x20, 12(x10)
> sb  x12, 12(x10)



### Sign extension of Imm12 bit number

>[!Question]
>What is the result stored in the destination register after the execution of the following instructions?
>ADDI x15, x12, 0x7ff
>ADDI x15, x12, 2049
>
>ADDI x5, x0, 0x7ff
>ORI x5, x0, 2049

mnemonics rd, rs1, imm


# Logical Operations

### Shift operations are I-type
there are no 12 bit requirements and we only need to the 7 bits in func7 for the opcode
## Shift right Logical
Its goal is to divide the rsi(operand) with 2^n where n is the number of times it is shifted 
Zero is appended to the positions that were shifted
>[!Question]
>Divide a>88 by 8 & b>-88/8 in assembly using right shift operators

>[!Solution]
>a>
```asm
addi x6, x0, 88
srli x5,x6, 3
````
>[!Solution]
>b>
>The obtained result in the x5 register is going to be wrong, since the MSB is appended with 0 for a -ve number which should be appended with FFF or 111 instead.  
```asm
addi x6, x0, -88
srli x5, x6, 3
```

## Shift right arithmetic 
>[!Example]
```asm
addi x6, x0, -88
srai x5, x6, 3
```
This is for all signed numbers that need to be divided.
the difference from the opcode for the logical operation is seen in the func7 
## Shift Left Logical
Its goal is to multiply the rsi(operand) with 2^n where n is the number of times it is shifted 
Zero is appended to the positions that were shifted


## Example Codes

>[!Question]
>Write a program for the following C-statement, write the corresponding RISC-v assembly code. Assume the base address of the variables f, g, h, i & j are mapped to x5, x6, x7, x28 & x29, respectively. Assume that the base address of the arrays A & B are n registers x10, x11, respectively.
>	B[8] = A[ i-j]

>[!Solution]
>f -> x5
>g -> x6
>h -> x7
>i -> x28
>j -> x29
>A ->x10
>B ->x11
```asm
sub x30, x28, x29 # computing i-j
slli x30, x30, 2 # offset = index*4 = x30<<2 = (i-j)*4
add x3, x30, x10
lw x30, 0(x3)
sw x30, 32(x11)
```

>[!Note]
>If the index is unknown for a load or store follow the following steps to calculate the physical address
>- Shift the index register towards left by 1(half word), 2(word) & 3(double word) depending on the data type.
>- add the 



# Language of the Computer - Instructions

>[!Question]
>Translate the following C code to RISC-V. Assume that the variables f, g, h, i & j are assigned to registers x5, x6, x7, x28 & x29, respectively. Assume that the base address of the arrays A & B are in register x10 & x11, respectively. Assume that the elements of the arrays A & B are 4-byte size:
>B[8]  = A[i] + A[j]; 

>[!Solution]
>```asm
> .data
> a: .byte 0x12. 0x23, 0x34, ox56
> 
> .text
> la x10, 0(a)
> 
>```

Branches #todo #search 

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

# Procedures #important 
- Subroutine procedures #todo 
- 
## Supporting Procedures in Computer HW
- Put the parameters to pass to the subroutine (procedure) into the argument register (a0-a7).

- to avoid **saving & restoring** a register whose value is never used, which might happen with a temporary register. 

#question
What is and what is not supported in procedures


>[!Eg]
>The procedure string_copy, copies string y to string x using null byte termination convention of C, the base address of x in x10 and y in x11 and index i is mapped to x9
>```c
>void str_cp (char  x[], y[])
>{
>	size_t t;
>	t=0;
>	while((x[i] = y[i]) != 0)
>	{
>		i+=1;
>	}
>}
>```

>[!Solution]
>```asm
>
>.data
>x:
>y:
>
>.text
>la x10, 0(x)
>la x11, 0(y)
>addi x9, x9, x0
>
>
>strcp:
>addi sp, sp, -4
>sw x9, 0(sp)
>addi x9, x0, 0
>add x5, x11, x9
>lbu x6, 0(x05)
>
>
>```

## Leaf Procedures
Compiled Riscv assembly procedure
Assembly procedure should involve:
- Save the registers used by the procedures.
- Body of the procedure to perform the task.
- The value of f, should be in parameter register.
- Restore the old values of the registers we saved by "popping" them for the stack.
- Return from the procedure.
#### Note:
In RISC-v we don't have exclusive instructions for PUSH data and POP data from stack. 

#HW 
#### Compile to asm
```cpp
	int main(){
		int y;
		y = diffosums(2, 3, 4, 5);
	}
	
	int diffosums(int f, int g, int h, int i){
		int results;
		results = (f + g) - (h + i);
		return results
	}
```

#todo #important 

```asm
addi x10, x0, 2
addi x11, x0, 3
addi x12, x0, 4
addi x13, x0, 5

jal x1, diffosums

diffosums:
	add t0, x10, x11
	add t1, x12, x13
	sub x20, t0, t1
	jalr x1
	
addi x21, x10, 0



```


## Stack #todo #search 

- SP -> Stack pointer used to indicate the allocated memory used by the stack. 

LIFO #important 


There is no Dedicated Push and Pop instruction in RISC-V. #important 
### Push #search #todo 

### Pop #search #todo





## Nested Subroutine


there is a need for us to preserve the 


Alternate Options are: #important #search #todo 



# Recursion

## Nested Procedures - Recursive Procedures
**Nested Procedures**-> Procedures that invoke other procedures.
**Recursive Procedures** -> Procedures that invoke clones of themselves.
- go through the C recursion code and understand the process.

>[!Question]
>Write a C code to find the factorial using recursion, after which write a machine code to do the same as the C code.

>[!Question]
>Write a program to compute C0= d0^ d1^ d4^ d5^ d7, where d0, d1, d4, d5, d7 are the bits of a given byte

other questions that we might encounter for the isa are simple arithmetic boolean functions



# RISC-V Addressing for wide immediate & Addresses
auipc: Add upper immediate value to PC(program counter) and place result in rd

>[!Syntax]
>```asm
>auipc rd, imm[31:12]
>```

Eg:
auipc x11, 0x10000

PC = 0x00000 008
	= 0x10000
x11 = 0x10000 008

basic idea-> PC + relative addressing

## Use of auipc:
### METHOD 1
- It is used to calculate the base address of the symbol defined in the data segment using PC relative addressing mode.

this is helpful with things where we have big stacks


>[!Question]
>Assume the base address of variable a in the data memory to be accessed is 0x80000020 & PC present is 0x00000000c write the program to initialize the base address in x11 without using psuedo instructions
>

>[!Solution]
>```asm
.data
a: .word 0x12345678
>
.text
la x10 (a)
auipc x11, 0x8000
addi x11 x11 0x018
>```


### METHOD 2
- auipc used to calculate long target address of symbol beyond the range of jal
>[!Question]
>Assume address of symbol is 0x07FFF F018 and PC present = 0x00000 008, Write program change the control of execution to address of symbol.

>[!Solution]
>```asm
>
>```

# A simple Implementation scheme

Control line status for subset of instruction.
IMAGE #todo 
4-bit ALU control input using a small control unit
Multiple level of control - func field values are of interest and funct fields are used only when the ALUOp bits equal 10, we can use a small piece of logic that recognises the subset of possible values and generates the appropriate ALU of control signals.

# Control Unit 
Signals
- opcode
- ALUsrc
- MemRead
- MemWrite
- MemToReg
- Branch
- RegWrite
- ALUOp [1:0]
	- and -> 0000
	- or -> 0001
	- add -> 0010
	- sub -> 0110

## Data-path & Control Unit
### R-type instruction
IMAGE #todo 
#important 
>[!Question]
> Calculate the time taken to execute load, store, R-type n branch on input by considering the following time stamps:
> - T_IF = 200ms (time for instruction fetch)
> - T_ID = 100ms (time for instruction decoding)
> - T_Ex = 200ms (time for execution)
> - T_MEM = 200ms (time for memory access)
> - T_WB = 100ms (time for write back)


>[!Question]
>Assume that logic blocks used to implement a processor's Single cycle datapath have the following latencies:
>1. What is the latency of an R-type instruction (i.e. how long must the period be to ensure that this instruction works correctly.)?





>[!Note]
>1. Register read is the time needed after rising clock edge for the new register value to appear on the output. This value applies to the PC only
>2. Register set-up is the amount of time a register's data input must be stable before the rising edge of the clock. This value applies to both the PC & Register file



# Pipeline


- classification of control lines for the final 3 stages.


# Data Hazards
#important 
**When a planned instruction cannot execute in the proper clock cycle because datat that are needed to execute the instruction are not yet available.**
	It is also called **pipeline data hazard**
## Forwarding vs Stalling

##### Eg:
>[!Question]
>Assume the following sequence of instructions are executed in 5 stage pipelined datapath
>```asm
>add x15, x12, x11
>lw x13, 8(x15)
>lw x12, 0(x13)
>or x13, x15, x13
>sw x13, 0(x15)
>```

>[!Solution]
>```asm
>add x15, x12, x11
>nop
>nop
>lw x13, 8(x15)
>lw x12, 0(x13)
>nop
>or x13, x15, x13
>nop
>nop
>sw x13, 0(x15)
>```
>here there are dependencies based on whether the register is the source or destination register. There should be a gap of 2 cycles or instructions before you encounter the same register if the previous use case was a destination & the current use case is source. #important 


Missed quite a few things #todo #search 


>[!Question]
>Consider following sequences of instructions:
>lw x2, x1, x3
>and x12, x2, x5

>[!Solution]
>
