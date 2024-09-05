# Verilog Coding Guidelines
- 1: When Modelling sequential logic, use only nonblocking assignments.
- 2: When modeling latches, use only nonblocking assignments.
- 3: When modeling combinational Logic with an always block, use only blocking assignments.
- 4: When modeling both sequential and combinational logic withing the same always block, use nonblocking assignments.
- 5: No design should have mix blocking and nonblocking assignments in the same always block for HDL 
- 6: Do not make assignment to the same variable from more than one always block.
- 7: Use $strobe to display values that have been assigned using nonblocking assignments.
- 8: Do not make assignments using #0 delays.
# Procedural Blocks

*Why do we require Procedural Blocks?* #search
There are 2 types of procedures:
- Functions
- Tasks
- always 
	***Procedural blocks are parallelly run***
## Difference between Functions and tasks?
***There can be delay statements in tasks but functions have to produce the output immediately. (i.e. There can be no delays in function)***
= 
# Functions
there are with respect to simulation time 0
>[!Syntax]
>``` sv
>function return_type func_name (arguments)
>function reg [8] add(input reg [8] a,b) # the argument here is optional? #search 
>```
>How to call a Function?
>``` sv
>reg [8] out;
>initial out = add(in1, in2); 
>```

>[!Note]
>Return value of a function is set by assigning a to value to the name of the function.

>[!Syntax]
>```sv
>function reg [4] add(input reg [32] a,b):
>begin
>add = a+b;
>end 
>endfunction
>```

Function name can be used again? #search 

There are two types of quantity:
- Scalar -> net ---> this is to basically to say that it is a one bit value
- Vector -> bus ---> a Bus is set of nets ---> it is not a array #important 

### The Below are a few things that shall not be able have any time controlled statements
therefore things like the following are not allowed:
-># --> this is the basic delay for combinational block
-> ## --> this indicates clock delays for eg: ##6 indicates clock delay or delay of 6 clock posedges
-> @(posedge clk)
-> @(signal)
-> fork-join, fork-join any
->

### Function arguments directions
>[!Note]
>Default direction is input if no direction has been specified #important 

>[!Syntax]
>```sv
>function logic [16] func (int x, int y);
>```
>Same as:
>```sv
>function logic [16] func ( input int x, input int y);
>initial out = func(a,b);
>```

Once a direction is given, Subsequent formals default to the same direction
```sv
function` logic [16] func ( input int x, input int y);
```


## Void Functions
Functions can be explicitly declared as a void type, indicating that there is no return value from the function.
>[!Syntax]
>```sv
>function void print_state(...);
>$display("@%0t:state =%s", $time, cur_state.name());
>```

Default value for an Argument
In SV you can specify a default value that is used if you leave out an argument in the call.
>[!Eg:]
>```
>function void checksum(
>input int k, input bit [32] low =0, input int high =-1 
>);
>bit [32] checksum =0;
>//behaviour
>endfunction
>```

If you call this function without giving a value for the variable k then it'll through a compile error
>[!Note]
>If a default value is not specified in the arguments, then it is compulsory to specify at call time

## Passing Arguments by Name
If you have a task or function with many arguments, some with default values, & you only want to set a few of those arguments, you can specify a subset by specifying the name of the routine arguments with a port-like syntax.

## Function with Enum return type
>[!Syntax]
>```sv
>function typedef enum { IDLE, WAIT, LOAD, STORE} states_t get_next(...)
>```


# Tasks
## Tasks with Timing Control

>[!Code_Snipet]
>```sv
>task wait_for_mem(input [32] addr, expect_data, output success);
>logic data;
>	@(posedge clock);
>	data=mem[addr];
>	success = ( data == expect_data);
>endtask
>```

#search Task stack sharing and memory consumption : automatic keyword

### Directions
#### Ref directions #todo #search #important 


# Stratified Event Queue #search #todo 

## Verilog Stratified Event Queue 
Active Region
Inactive Region
NBA region -> Non Blocking Assignment 
Postponed Region

### Active region
- Blocking assignments: evaluation and update
- Evaluation of RHS of NBA
- $display and evaluate the inputs and updates outputs of primitives

>[!Question]
What is the final value of a?
module test;
reg a;
initial a =0; // T1
initial a =1; //T2
endmodule

In this case the value of a will be x 


>[!Question]
What is the final value of a?
module test;
reg a;
initial a =0; // WT
initial $display("Value of a=%b", a); //RT
endmodule

there are 2 active region cases in which there can be one case where the RT is executed 1st then we get x but if WT gets executed 1st then we get 0.


#gptreponse
[[Differences of $ function codes]]

Blocking statements are sequential in execution #important \
Non Blocking statements are concurrent or parallel in execution #important 

#edaplayground
To understand the differences https://www.edaplayground.com/x/YBPq

## SystemVerilog Stratified Event Queue
The **always** procedural block is used for generating purpose modeling.
At the RTL level, the always procedural  block can be used to **model**:

Combinational logic, latched logic, sequential logic

An if statement without an else is synthesized into an latch while an if statement with else is a mux. -> this is a problem of verilog

if at time 0, always block executes  
![[Pasted image 20240904091506.png]]

## SV Stratified Event Queue
![[Pasted image 20240904091736.png]]
In the above the grey is for design and the yellow is for testbench
### Preponed Region
### Active Region
### Observed Region
the assertion statements are run in this region
### Reactive Region
### Postponed Region


# Race within RTL

==NBA helps to see the old value of the flop while sampling==  #important #search 
>[!Rules]
>1. We always use non blocking statements





## RTL -> Register transfer Level

We use register to maintain a synchronous communication in the entire circuit.
>[!Note]
>There are times when there is no prior device that is in the final circuit and we still need to test the DUT for all test cases so we generate Testbench stimulus mimicking device 1 for device 2


# Races between RTL & Testbench
https://edaplayground.com/x/iiZ6 #edaplayground 

#### Asynchronous D ff with reset sv code with tb  with reset for full fpga implementation (make it a register for 4 bits)

>[!Note]
>Simulation runs 2 files one which is the testbench & the other is DUT



all the procedural blocks execute at simulation time 0
- these include initial and always block

>[!Note]
>In sv we dont write a tb in module we right it in a program block 
>- Program block is always executed far away from the sv file in terms of time of execution


there is a difference between always @(posedge clk) and @posedge clk this is an important point to note #important 

there is a different effect to both = and <= (blocking and non-blocking) since they will execute in different regions.


## How do we overcome the race between the RTL and testbench
#### Program block
- It is run at the end after the modules have been run
- The testbench is written  in the Program block #important 


[[obsidian://open?vault=Sem_5&file=Excalidraw%2FDrawing%202024-09-04%2009.43.54.excalidraw|Graph of code execution!?]]
