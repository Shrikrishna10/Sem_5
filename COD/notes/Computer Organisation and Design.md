
# **ISA - Instruction Set Architecture**

Hardware- Digital only, processor[core]


Software- The code which is written in our programming languages can't be directly understood by the Hw. So we need to convert to binary. Here your code is converted to assembly language by the compiler, this is then again converted to binary by the assembler which requires an ISA to work.


## RISC: Reduced Instruction Set Computer
## CISC: Complex Instruction Set Computer



# Classification of Processor based on ISA
-Instruction Set Complexity: Addressing Modes
-Direct Memory Access and Load & Store Architecture.
-# of Clock Cycles to execute Instructions.
-Instruction Format
-Mode of Execution: Pipelining & Non-Pipelining.
-# of on-chip Registers
-Complexity of Decoder, Control & Sequence Generator.

# Make the Common Case Fast
The Load-store computer architecture separates instruction into:
- Memory Access operations[load and stores] and 
- Into operations that operate on the data in the register file [register to register or register to immediate] 
*By not combining memory accesses with the data manipulation operations,* **the processor's complexity is reduced which enables making the common case fast**
(Direct and Indirect Memory Access)

In Cisc arch the number of clock cycles to complete the action depends on the complexity whereas in Risc the number of clock cycles is somewhat constant.



