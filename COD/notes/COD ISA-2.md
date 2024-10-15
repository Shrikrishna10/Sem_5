https://www.perplexity.ai/search/what-are-the-different-hazards-Cjp8lLXtRdKOiraLOMenbw
#gptreponse 
# Hazards
## Structural Hazards
- It means that the hardware cannot support the combination of instructions that we want to execute in the same clock cycle.
- When a planned instruction cannot execute in the proper clock cycle because the hardware does not support the combination of instructions that are set to execute.

>[!Note]
	Assume a single memory instead of 2 -> Single Memory holding code & data
	- If the 5-stage pipeline had a fourth instruction, we would see that in the same clock cycle, the first instruction is accessing data from memory while the fourth instruction is fetching an instruction from the same memory. Without 2 memories our pipeline could have structural hazards.
#todo 

## Control Hazards/ Branch Hazards: Stalls
- Control Hazards arise when there is need to make decision based on results of an instruction while other instructions are executing.
	- Eg: A conditional Branch instruction (beq)

### Branch Predictions
- In comp. arch. a branch predictor is a digital circuit that tries to guess which way a branch will go before this is known definitively. This reduces the effect of pipeline flush.
- Branch prediction reduces the effect of a pipeline flush by predicting possible branches & loads the new branch address prior to the execution of the instruction

### Stalls
Hardware soln.  

# Case Study of Eg:

We will start with single cycle rv32
## Single Cycle RV32
```asm
addi x5, x0, 0x5A
addi x7, x5, 0x5A
```


## W/o Forwarding / Hazard Detection









## Table
```asm
addi x5, x0, 0x5A
addi x7, x5, 0x5A
```

| Processor                                  | # of Instructions | # of clock cycles taken | CPI | IPC | Ideal case | Comments                                                                |
| ------------------------------------------ | ----------------- | ----------------------- | --- | --- | ---------- | ----------------------------------------------------------------------- |
| Single cycle                               | 2                 | 2                       | 1   | 1   | x          | No dependency issues                                                    |
| 5 Stage w/o Forwarding / hazard detection  | 2                 | 6                       | 6/2 | 1/3 | 6          | Result is wrong: ex hazard                                              |
| 5 Stage w/o Forwarding / hazard detection  | 4                 | 8                       | 8/4 | 1/2 | 5+(4-1)    | Ex Hazard is managed by introducing 2 nop                               |
| 5 Stage w/o Forwarding Unit                | 2+2 stalls        | 8                       | 8/2 | 1/2 | 8          | Ex Hazard is managed by the system, using hardware approach of stalling |
| 5 Stage w/o Hazard detection               | 2                 | 6                       | 6/2 | 1/3 | 6          | Ex hazard dealt with forwarding                                         |
| 5 Stage with Forwarding & Hazard detection | 2                 | 6                       | 6/2 | 1/3 | 6          | Ex hazard dealt with forwarding                                         |

>[!Note]
>The hazard detector in ripes simulator is taking care of resolving all types of data dependency by introducing nop

# MCQs for ISA 2 #important #isa 
>[!Question]
>1. In a pipelined arch. if we use von nueman bus arch(common mem for both code and mem). What is the type of hazard it leads to?
>	1. Data hazards
>	2. Control hazards
>	3. **Structural hazards**
>	4. None 
>
>1. In the 5 stage pipelined arch. In which stage the outcome of the branch statement will be known?
>		- Ans -> Mem access stage
>2. In this stage what type of hazard it leads to & how many clocks would get wasted to resolve the hazard?
>	1. Data Hazard, 3clk
>	2. Structural, 3clk
>	3. Control, 1clk
>	4. **Control, 3clk**
>
>4.Which technique is used in order to address the control hazard in a 5 stage pipelined arch.
>	1. Branch predictor
>	2. Flushing the instructions which have entered the pipeline after the branch instruction
>	3. Flushing the instructions which have entered the pipeline before the branch instruction
>	4. **Both A & B**
>
>5. If the hardware for comparison & adder which were present in the execution stage are moved to decoder stage such that the outcome of the branch is known in the decoder stage, what will be the number of clks which will be wasted in flushing the instructions if the outcome of branch is true?
>	1. 3 clks
>	2. 2 clks
>	3. **1 clks**
>	4. 0 clks
>
>- Consider the following program, which is getting executed on a 5 stage pipelined arch.:
>	- In the Program given if branch on equal is in mem access stage, then which are the instructions which are in the Ex, ID & IF stage.
>	- If the outcome of the branch is true what will the value that is updated in the PC be?
>	- If the outcome of the branch is true which addressing mode do you use in order to calculate PC new?
>	- If the outcome of branch is true which are the instructions to be flushed and how many clocks are getting wasted?



# Exceptions / Interrupts
- They are unexpected events generated internally(within CPU) or externally(External I/O controllers) requesting for a service.
- Exceptions are unusual conditions that occur at run time, associated with an inst. in the current RISC-V hart.
- Interrupts are events that occur asynchronously outside any of the RISC-V harts.
- An exception/interrupt will change the normal flow of instruction execution.
- Dealing with them without sacrificing performance is hard.
>[!Note]
>Priority is given to some other  function or program that will take up the working section of the processor, while what was running before will be cached for the interrupt to have finished the work before coming back to the functioning section of the working core
>Bad english but understandable

>[!Note]
>Difference between Exceptions & Interrupts 
>Interrupts:
>	It is a signal that is generated external to the core to trap the processor & request for a service. 
>	It is asynchronous
>Exceptions:
>	it is a signal which is an unexpected event that are generated internally within a CPU to trap the processor and request for a service
>	It is synchronous

>[!Question]
>is the following a exception or interrupt


## Misaligned
In RISC-V inst. address is is always aligned to 4- byte or 2 byte even mem. loca. It is a misaligned if the mem. loca. is not even. ? #todo

# Privilege Lvls / Modes
There are 3 different Privi lvls:
- User/ application mode - [U]
	- A process running here cannot modify any of the hardware or the control & status registers.
	- It **must** execute a **system call** so a **higher privi mode** can do that action on it's behalf 
- Supervisor Mode - [S]
	- Allows the program to modify any supervisor-lvl control & status registers
	- **S-mode is designed for running a kernel**
- Machine Mode - [M] 
	- Allows unfettered access to all control & status lvl registers. 
	- Any program running in M-Mode has virtually no restrictions


All cores have machine mode


## Direct & Vectored Mode of TRAP Handling
### Steps involved in Exception/ Interrupt Handling #important 
- The processor completes the execution of the inst. which are in mem. access stage & WB stage
- It flushes the inst. with the help of control unit & control status register, which are present in Ex, ID & IF stage,
- SEPC & SCAUSE get updated due to the unexpected event where:
	- SEPC is loaded with the address of the inst. which is there in Ex stage, 
	- SCAUSE gets updated indicating the cause of TRAPPING
- The control of execution moves from main program to the trap handler using: 
	- Direct Approach: PC = base address of handler
	- Vectored Approach PC = base address of handler + 4* Index of exception code from vector table
- The flow of control will return to the main program if it is restart-able, by completing the following:
	- Use SEPC to return to the program, SEPC = PC
- otherwise the code is terminated, report errors using CSR register.


### Two modes used for TRAP Handling

exception code helps to identify the type of exception

#### Method 1: Direct Mode

mtvect: Machine TRAP Vector Register


| mtvect [31:2]                                         | mtvect[1:0]                                                                        |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Base address [31:2]                                   | Mode                                                                               |
| Base address gives the of the Directed/ vectored Mode | Here above the Mode can be:<br>- 0x0 Direct<br>- 0x1 Vectored<br>- >= 0x2 Reserved |


##### scause / mcause register

Mcause: When an exception/interrupt happens, the hw sets the mcause register with the corresponding exception code.
- The pc is set to the trap handler base address
- The exception code helps to identify the type of exception.


>[!Question]
>1. Assume there is a illegal inst. getting executed, what will be the value in scause, refer to the table for exception code?
>	- Ans ->code 2
>
>2. If the scause MSB is 1 what does it mean? what is the cause for the trap?
>	1. **Interrupt**
>	2. Exception
>	3. Both
>	4. None

>[!Note]
>There is no instruction to update the scpc.

#### Method 2: Vectored Interrupts




>[!Note]
>- In case of direct mode all synchronous exceptions and asynchronous interrupts TRAP to the base address defined in the empty vector register
>- Once the control of execution changes from TRAP handler, the SW must read the scause/ mcause register to determine what triggered the TRAP.
>  - The Supervisor Exception Cause Register or SCAUSE/ Machine cause Register MCAUSE are the register used depending on privi mode, to identify the reason for the exception

### Exception/ Interrupt CSR Registers
Global enable & disable.
- Each of the timer, sw, & external interrupts can be enabled individually.
- Globally, all the interrupts can be enabled/ disabled using the MIE bit in the SSTATUS/MSTATUS register. 
- MIE -> Machine Interrupt Enable register:
	this is individually there for all the timer, sw & external interrupts
	- MTIE
	- MSIE
	- MEIE
- MIP register -> Machine Interrupt Pending register, The bits in mip indicates which interrupts TRAPs pending to be served. MEIP is read-only in mip & is set & cleared by a platform specific controller.

>[!Note]
>- MIE -> 
>This MIE register is globally enabled/ disabled by using MIE bit in a SSTATUS/MSTATUS
>If there are more than 1 exceptions/ interrupts available then there is a high chance of more than 1 trapping the processor, in this case the processor is going to check the priority of the interrupt or exception to service 1st. The rest of the services or interrupts will be the pending traps to be serviced later. These pending exceptions or interrupts will be updated in a register called MIP.

>[!Question]
>Consider the program given: 
>40: sub x11, x2, x4
>44: and
>48: or
>4c: add
>50: sub
>54: lw
>
>Assume the inst. are being executed on a 5 stage pipelined processor, show what happens in the program if a hw malfunction & the add inst is in the Ex stage of the pipeline to be invoked on an exception
>1. What will be content of SEPC & scause?
>2. where the control of execution transfer?(new value of PC)
>3. which are the inst. in the pipeline which will be getting flushed & which gets executed?

>[!Solution]
>1. SEPC will hold the value of 4c
>2. the new value of is 
>3. the 1st inst. is already completed, the 2nd & 3rd are in the mem. access & WB stage, while the rest of the code is flushed.



## Timer Interrupt
- A timer interrupt is caused when a separate timer ckt indicates that a predetermined interval has ended
- The timer subsystem will interrupt the current executing code.
- These interrupts are handled by the OS which uses them to implement time sliced multi-threading.

### Mtime 
mtime register is a synchronous counter & it starts running form the time the processor is powered on & provides the current real-time in ticks

### mtimecmp register
- this register is used to store the time period after which a timer interrupt should happen.
- the value of mtimecmp is compared with the mtime register.
- when the mtime becomes greater than mtimecmp a timer interrupt happens
- both the mtime & mtimecmp registers are 64-bit mem.-mapped registers

>[!Question]
>5. Assume there is an illegal instruction getting executed, what value will be updated in the scause register
>    ![[Pasted image 20241014121952.png]]
>	1. Interrupt bit = 1 & Exception Code= 2
>	**2. Interrupt bit = 0 & Exception Code= 2**
>	3. Interrupt bit = 0 & Exception Code= 1
>	4. Interrupt bit = 1 & Exception Code= 4
>6. If the scause MSB is 1 what is the cause for the trap?
>	1. interrupt
>	2. exception
>	3. both
>	4. none
>7. Which of the following is not an exception
>	1. system reset
>	2. invoking the os from use program
>	3. using undefined inst.
>	4. I/O device request
>8. Which of the following is either an Exception/ interrupt?
>	1. I/O device request
>	2. using undefined inst
>	3. I/O device request
>	4. Hw malfunctions
>9. Interrupts are unexpected events that occurs
>	1. Asynchronously inside
>	2. synchronously inside
>	3. Asynchronously outside
>	4. none
>10. which of the following modes has the highest privi?
>	1. S-mode
>	2. M-mode
>	3. U-mode
>	4. none
>11. which of the following modes is a must to have in a RISC-v SOC?
>	1. S-mode
>	2. M-mode
>	3. U-mode
>	4. all
>12. ecall is an inst used to
>	1. switch between privi modes
>	2. transfer control to debugger
>	3. transfer control to subroutine
>	4. none
>13. in the case of the Vectored mode of trap handling, control of execution transfer to the handler by updating the PC with __
>	1. VT_BaseAddress + 4 * Exception Code from scause
>	2. VT_BaseAddress 
>	3. VT_BaseAddress + Exception Code from scause
>	4. none
>14. in which of the following trap handlers the SEPC is copied into PC to restart the TRAPPED program
>	1. user timer interrupt TRAP handler
>	2. illegal inst trap handler
>	3. inst addr. misaligned trap handler
>	4. none
>15. which timer register provides the current real time in ticks?
>	1. mtimecmp
>	2. mtime
>	3. both
>	4. none
>16. which timer register is used to hold the initial count as reference wrt time period to generated 
>	1. mtimecmp
>	2. mtime
>	3. both
>	4. none
>17. Under which of the following conditions the timer interrupt is invoked 
>	1. mtime< mtimecmp
>	2. 