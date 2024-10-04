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

# Exceptions
