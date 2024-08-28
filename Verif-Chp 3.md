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

