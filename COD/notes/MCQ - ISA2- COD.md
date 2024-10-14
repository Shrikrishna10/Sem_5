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


>[!Question]
>is the following a exception or interrupt


>[!Question]
>1. Assume there is a illegal inst. getting executed, what will be the value in scause, refer to the table for exception code?
>	- Ans ->code 2
>
>2. If the scause MSB is 1 what does it mean? what is the cause for the trap?
>	1. **Interrupt**
>	2. Exception
>	3. Both
>	4. None

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

