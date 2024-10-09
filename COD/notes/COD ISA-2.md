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
