# SystemVerilog Functions

*Why do we require Procedures?*
There are 2 types of procedures:
- Functions
- Tasks

## Difference between Functions and tasks?
***There can be delay statements in tasks but functions have to produce the output immediately. (i.e. There can be no delays in function)***
= 
>[!Syntax]
>``` sv
>function return_type func_name (arguments)
>```

