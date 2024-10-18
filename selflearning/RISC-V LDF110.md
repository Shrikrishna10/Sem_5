# Resources
https://trainingportal.linuxfoundation.org/courses/introduction-to-risc-v-lfd110
https://projectf.io/postas/riscv-cheat-sheet/
https://riscv.org/wp-content/uploads/2019/06/riscv-spec.pdf
http://riscvbook.com/
http://riscvbook.com/greencard-20181213.pdf


# Naming convention for RISC-V

## RV32IMAC 
- The first two letter RV is used to indicate the core uses RISC-V ISAs.
- This is then followed by the bit-width.
- This is then followed by a series of 1-letter indicators for the base ISA and its extensions.
	- The **RV32I** is together known as a 32-bit  CPU with the Base Integer ISA. [This includes the absolutely necessary instructions for basic operations.]
	- **M:** The Integer Multiplication and Division extension.
	- **A:** The Atomic Instruction extension.
	- **C**: The Compressed Instruction extension. This extension provides an alternative 16-bit encoding for a special subset of existing RV32I instructions, which are encoded in 32 bits.
	Some other indicators are:
		-  **F**: Single-precision floating-point operations.
		- **D**: Double-precision floating-point operations.

The image below is a graphical representation of the unprivileged RISC-V instructions set. 
![[RV32IMAC Instruction Set.png]]

The image shows the Modular nature of the RISC-V. The mandatory base ISA is combined with a set of extensions.

# Introduction

> [!Side Info?]
> **What is an ISA?**
> ISA stands for Instruction Set Architecture. It is an abstract model of a Computer. It is also referred to the computer architecture. Realisation of an ISA is called an implementation. Some Eg. are x86 by Intel, ARM, MIPS, etc.
## How is RISC-V different?
The most important thing about RISC-V is the fact that it is open-source and is developed by a community of like minded folk who just want to contribute to improving the project. This means to say that RISC-V is developed by a member organisation that is completely free to join and licenses its ISA with permissive open source licenses. So anyone can contribute to it and there is no owner as such.

>[!Side Info]
>A RISC-V Specification starts its life as a Task Group approved by the Technical Steering Committee (TSC). Once a Task Group has an approved charter, they begin work publicly on GitHub by writing their documents in AsciiDoc format. These repositories on GitHub can only receive pull requests from RISC-V International members, however the work is done publicly and transparently. For groups who choose to take minutes, those minutes from the Task Group meetings are published publicly as well. The public is free to submit issues to the GitHub repository in order to give early feedback on any specification. 
>
 Non-ISA specifications and standards (e.g., processor trace, architectural tests, software overlay) are developed in a similar fashion. RISC-V Specifications live on GitHub and are housed alongside dozens of software projects. A list of ratified specifications and the links to their GitHub repositories can be found on the [RISC-V Specifications website](https://riscv.org/technical/specifications/).

## RISC-V Extensions Lifecycle
The three stages of ISA Extensions development:
- An extension begins developed by its proponent and/or the community at large is referred to as in "Open" status.
- When all the main features of the extension have been developed to the point that no substantial modifications are deemed possible, except for very minimal updates, the extension is referred to as in "Frozen" status.
- A frozen extension is subject to a period of public review for further refinement and to a final ratification-by-vote, after which the extension is referred to as in "Ratified" status.
![[Pasted image 20240818083115.png]]

Each RISC-V extension goes through a number of stages on its way to ratification. These stages are referred to as *milestones*. 

These milestones are the checkpoints for these projects and can be generally classified as:
- _**The Plan Milestone**_ creates two key documents for use throughout the whole lifecycle, the Ratification Plan and the Status Checklist.
- _**The Development Milestone**_ creates the early versions of the specification and declares them reasonably stable.
- _**The Stable Milestone**_ continues specification development until it is self-consistent and stable.
- _**The Freeze Milestone**_ brings the document to feature complete, declares that no substantive changes are planned, and prepares the document for Public Review.
- _**The Ratification-Ready Milestone**_ holds the Public Review, addresses any issues, and performs final activities before asking for TSC(Technical Steering Committee) Approval and Board of Directors Ratification.
- _**The Ecosystem Development Milestone**_ manages on-going open source software community work across the multitudes of projects which can be impacted by a specification in a continued effort to achieve upstream community support.
Once an extension has been ratified, it is added to either the Unprivileged or Privileged Specification. Occasionally a specification is created as part of a separate document, with the debug specification being the most common example. However, this is a rare case and usually indicates that the extension is not part of the ISA, but rather a “standard” or “non-ISA specification”. We will now review the Unprivileged and Privileged Specification in greater detail.

# Organising the Specifications
The RISC-V ISA is broken up into 2 parts:
- Vol 1: Unprivileged Specification
- Vol 2: Privileged Specification

To understand the difference we need to look into the computer architecture and security.
Processors used hierarchical protection domains, often called privilege rings, to protect data and code from malicious actors. For illustration purposes, the following picture shows the privilege rings for the x86 processor, by Intel, along with their common uses.
![[Pasted image 20240818191141.png]]

The most privileged code runs in “Ring 0” and has access to the entire system. The processor will decide which privileges to grant executing code based on the privilege level. As an example, accessing memory by physical address may be restricted to “Ring 0” such that other rings must reference the virtual address space. Typically the processor can run in only one of the privilege modes at a time and there are special instructions to move between modes. All of these details can change from system to system, however they must follow the rules set out in the specification documents of a given architecture.

RISC-V has three privilege levels: User Mode (U-mode), Supervisor Mode (S-mode), and Machine Mode (M-mode). One can think of these as “Ring 2”, “Ring 1”, and “Ring 0” respectively. Other modes like a hypervisor mode (H-Mode) are available as variations of these 3 basic modes.

Much like in the figure above, U-mode is for user processes, S-mode is for kernel and/or device drivers, and M-mode is used for bootloader and/or firmware. Each privilege level has access to specific Control and Status Registers (CSRs), which are special registers that report the state of the system, or control its behaviour. Higher privilege levels can access the CSRs of less privileged levels.




# RV32I Base instruction set

There are only 40 instructions in RV, so all functionality needs to be achieved with that and another limitation being the number of bits in register data size being 32 for RV32.

The Base ISA also specifies the 32 cpu register which are 32 bits in size, + a program counter.

The only special register in the 32 is x0 which is grounded and always holds the value of 0 in all positions. The other registers dont necessarily hold specific values and are general purpose, we have something known as **ABI** which stands for application binary interface which specifies a purpose for all the register according to its *calling convention* #search . 

This means that some registers are expected to hold particular values such as:
- temp
- saved data
- pointers
- return address, 
etc. The table below shows em
![[Pasted image 20240919110615.png]]


### A few of the important instructions encoded in the are 
#### Addition
#### Subtraction
#### Bit-wise logical operations
#### Load & store
#### Jumps
#### Branches


# Control & Status Register(CSRs)
CSRs are a separate bank of registers that are 12-bits in size that contains CPU info like counter, timers, flags, manufacturer info & other data.
**CSRs are special registers designed to control and monitor the processor's operation.**
Some of the Important CSRs are:
1. **mstatus** (Machine Status Register): This CSR is arguably the most critical one as it controls and monitors the machine's operating mode and privilege level. It contains fields for controlling interrupt enable/disable status, setting the privilege level (M-mode, S-mode, U-mode), and various flags that influence the processor's behavior. It is fundamental for privilege level transitions and interrupt management.
2. **mepc** (Machine Exception Program Counter): Stores the program counter value of the instruction that caused an exception or interrupt in machine mode. It determines where the program should resume execution after handling the exception.
3. **mtvec** (Machine Trap-Vector Base Address): Specifies the base address of the trap handler for machine mode, determining where the processor should jump to when an exception occurs.
4. **mcause** (Machine Cause Register): This CSR provides information about the reason for the most recent exception or interrupt. It distinguishes between exceptions and interrupts and gives a code indicating the specific cause, such as a page fault or a software interrupt.
5. **misa** (Machine ISA Register): Specifies the supported instruction set extensions for the processor, allowing software to determine the capabilities of the RISC-V processor. It also encodes the bit width of the base ISA (RV32, RV64, or RV128).
These CSRs are fundamental for the operation of a RISC-V processor, enabling privilege mode control, exception handling, and providing information about the processor's capabilities and recent events. There are many more CSRs that serve important functions, these five are among the most critical for basic processor operation and software development.

# ISA Extensions
## M Extension
This extension if for multiplication. It has 8 instructions to perform multiplication and division on integers.

>[!Note]
>It may seem odd that this extension is not required. However, for many embedded processors, multiplication can be done in software if it is not required very often or even at all.

## F Extension
This extension adds support for single-precision floating-point arithmetic operations.  Single-precision floating-point are typically represented using 32 bits, conforming to the IEEE 754 standard.

This extension introduces single-precision floating-point registers (**f0** to **f31**) and a set of single-precision floating-point instructions for operations such as addition, subtraction, multiplication, division, and conversions between integer and single-precision floating-point values.
The F extension also includes instructions for handling special values, like NaN (Not-a-Number) and infinities, and for comparing and rounding single-precision values.


## D Extension
D for Double
This extension extends the floating poit capabilities of RISC-V to include double-precision floating point arithmetic operations. Double-precision use 64 bits for representation & also follow the IEEE 754 standard for double-precision arithmetic.

With the D extension, double-precision floating-point registers **f0** to **f31** are now 64-bit wide, and it supports instructions for double-precision arithmetic operations, conversions between integer and double-precision values, and handling special values.
Double-precision arithmetic is particularly important for scientific and engineering applications that require higher precision than single-precision arithmetic can provide.
Again, many embedded applications do not require floating point logic, and hence these extensions are not part of the Base ISAs.

## C Extension
The compressed instruction set extension is a clever addition to the RISC-V ISA, which provides an alternative 16-bit encoding for a special subset of existing instructions, reducing static and dynamic code size. This doesn't replace the ones that are already there just gives us the option to save more memory



The C extension is compatible with all other standard instruction extensions. These 16-bit instructions may be freely intermixed with 32-bit instructions. This means that any instruction can start on any 16-bit boundary. As such, with the addition of the C extension to any system, no instructions can raise instruction-address-misaligned exceptions.

**Pseudo-instructions** are special instructions added to the assembly language to make programming less cumbersome. Pseudoinstructions have a direct translation to machine code, and are supported by assemblers and compiler toolchains.

The C extension provides hardware support for specific versions of existing base ISA instructions.
[[RV32IMAC Instruction Set.png]]

Thus, one difference is that pseudo-instructions are a logical addition (software), whereas instructions from the c extension represent a logical and a physical addition (software and hardware).

## More Extensions

The open nature of RISC-V allows for a rich proliferation of other extensions that we will not cover. Here we have some examples:

- The A extension, for Atomic Memory Operations
- The Q extension, for quad-precision floating-point operation, introducing 128-bit wide floating point registers
- The B extension, for bit manipulation
- The S extension, for supervisor operation
- The H extension, for hypervisor operation
- The L extension, for decimal floating-point operation
- The P extension, for Packed-SIMD instructions
- The V extension, for vector operations
- The Zicsr extension, for manipulating CSR registers
- The Zifencei extension, for instruction memory synchronization

Once again, this list is not exhaustive.

Almost all of the above extensions are _ratified_, and only the L and P extensions are still under discussion, and thus _open_.

# Unsupported Instructions
Compilers are informed of the extensions included in the target CPU so that they can generate the best possible code. If the code contains an instruction from extensions that are missing in the physical CPU, the decoding of that instruction will trigger an illegal instruction exception. The software running on the CPU will have to handle this exception and take appropriate action, such as emulating the instruction or providing an alternative implementation, possibly from the standard library.

# Instruction Encoding
![[Instruction Format for RV32I.png]]

The RV32I ISA specifies the following elements:

- 1 32-bit wide Program Counter Register
- 32 32-bit wide Registers named x0 to x31
- 40 Unique 32-bit wide unprivileged Instructions in six different formats (R, I, S, B, U, J) but with some recurring fields:
- A major opcode in the 7 least significant bits of the instruction, identifying the instruction.
- Source registers (rs1 always in bits 15 to 19, rs2 in bits 20 to 24).
- Destination register (rd in bits 7 to 11) fields.
- Function fields, or minor opcodes, named _funct7_ or _funct3_ depending on their bit width. _Funct7_ occupies the last 7 bits of the R type instruction and _funct3_ always occupies bits 12 to 14.
- Immediate fields, which always tend to be towards the end (left side) of the instruction and are encoded differently depending on the instruction type.
- 24 additional unique 32-bit wide privileged instructions in two formats (R and I).

## An Example and explaination:

Instruction mnemonics are used in RISC-V assembly language to represent specific instructions in a more human-readable form. A mnemonic is a short string of letters that represents a specific instruction. 

For example, in the instruction **"add x1, x2, x3"**, "**add**" is the mnemonic that represents the add instruction. Functionally, that instruction means “add the contents of **x2** with the contents of **x3**, and store the result in **x1**”.

When an assembler encounters a mnemonic in the source code, it will use that mnemonic to translate the instruction into the corresponding machine code representation of the instruction, along with the encoding of the operands.

For example, the instruction "**add x1, x2, x3**" is translated by the assembler into the machine code instruction **0x003100B3**. This long hexadecimal number can be extended to binary as follows:

**0000 0000 0011 0001 0000 0000 1011 0011**
![[ADD.png]]
As shown above, these are the meanings of the bit fields in the encoded instruction:

- **funct7**: **0000000**
- **rs2**: **00011**, which means **x3**
- **rs1**: **00010**, which means **x2**
- **funct3**: **000**
- **rd**: **00001**, which means **x1**
- **opcode**: **0110011**, which means **add**

Keep in mind that mnemonics are used for both instructions and pseudoinstructions, which the assembler converts to machine instructions.

## Instruction Types
### R-type: 
Instructions are used for operations that involve two source registers and one destination register. They typically include arithmetic and logic operations, such as addition, subtraction, bitwise operations, and comparisons.

### I-Type:
Instructions are used for operations that involve an immediate value (a constant) and a source register. Common I-Type instructions include load operations as well as arithmetic operations with immediate values (e.g., **addi** for "add immediate").

### S-Type:
Instructions are a subset of I-Type instructions specifically used for storing data into memory. They involve a source register, an immediate offset, and a base address register to specify the memory location where the data is to be stored.

### B-Type:
Instructions are used for conditional branching operations. They compare two registers and, based on the result, determine whether to take a branch instruction or not. Common B-Type instructions include **beq** (branch if equal) and **bne** (branch if not equal).

### U-Type:
instructions are used for setting the upper bits of a register to a constant value, which is often used for initializing pointers or addresses. The U-Type instructions include **lui** (load upper immediate) and **auipc** (add upper immediate to PC).

### J-Type:
Instructions are used for unconditional jump operations. The jump instruction transfers control to a specified target address, like the **jal** (jump and link) instruction used for subroutine calls.

# Immediates & Addresses:
Other than opcodes and registers, any instruction encoding other than R-Type may contain immediates, that is a piece of data encoded directly in the instruction, rather than in memory or in a register. This data can represent either constants, to be used for example in arithmetic operations, or as memory addresses or offsets.

Different handling of immediates is the exact characteristic that defines the instruction types, but all of them tend to encode the immediates in similar positions in order to simplify the implementation of the hardware immediate decoder. All immediates decode to 32-bit wide values, but encoding varies by instruction.

# question
![[Some important questions.png]]

# Peculiar RISC-V Design Decisions
- There are no Flags/Condition-Code Register
- Register x0 is hardwired to 0
- There is no way to specify a 32-imm in a single instruction.
- There are no dedicated multiply / divide instruction in the base RISC-V ISA
- There are lots of basic instruction missing 
- There is no Stack Pointer.
- There are no 'push' or 'pop' instructions
- There are no subroutines 'call' or 'return' instructions

# Introduction to Privileged Specification
For most modern processors, the M-mode and S-mode is a must for certain applications. These modes have elevated privileges & are described in a complete separate document.

![[PriviModes.png]]
The diagram shows a virtual machine monitor configuration where multiple multiprogrammed operating systems are supported by a single hypervisor. Each OS communicates via a supervisor binary interface (SBI) with the hypervisor, which provides the supervisor execution environment (SEE). The hypervisor communicates with the hypervisor execution environment (HEE) using a hypervisor binary interface (HBI), to isolate the hypervisor from details of the hardware platform.

Minimum lvl in the processor these days.


# M-Mode
M-mode is used for low-level access to a hardware platform and is the first mode entered at reset, when the processor finishes initializing and is ready to execute code. M-mode can also be used to implement features that are too difficult or expensive to implement in hardware directly. A good example of this would be a watchdog timer implemented in low level software (firmware) which helps the system recover from faults.

## Non-Maskable Interrupts
Non-maskable interrupts (NMIs) are only used for hardware error conditions. When fired, they cause an immediate jump to an NMI handler running in M-mode, regardless of how that hardware thread has its interrupt-enable bit set. In other words, that interrupt will be serviced without a way to block the service in configuration. Each NMI will have a “mcause” register associated with it. This allows implementations to decide how they wish to handle these interrupts and allows them to define many possible causes. NMIs do not reset processor state which enables diagnosis, reporting, and possible containment of the hardware error.

## Physical Memory Attributes (PMAs)
