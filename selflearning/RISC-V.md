# Resources
https://trainingportal.linuxfoundation.org/courses/introduction-to-risc-v-lfd110
https://projectf.io/postas/riscv-cheat-sheet/
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
![[Pasted image 20240818071706.png]]

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
