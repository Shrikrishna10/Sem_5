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
