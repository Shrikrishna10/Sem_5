the job of the compiler is to assign the required data for the code to run
verilog has no dynamic arrays
sv has dynamic arrays

# SV Data Types

There are 3 directions in SV they are input output and inout

## Bit
Eg:
```verilog
module y1;
bit y;     -> this is called a scalar bit notation  
$display(y);
in the bit declaration we can use square brackets to make it an array of bits in this format:
bit [2:0]y; / bit [0:2]y; / bit [3]y;
- It can take signed and unsigned values. By default it is unsigned
```

## Byte 
Eg:

```verilog
module y2;
byte y; -> this is the sames as saying bit [7:0] y;
$display(y);
```
## Other data types are:
- short int [16-bits]
- int [32-bits] 
- long int [64-bits]
all of the above are signed 
- String ->array of character to store strings with each character taking 8 bits which is assigned internally by the system 
- shortreal -> 2-state single precision floating .pt variable



*You can change a signed data type to unsigned and vice versa using the keywords for them* 

## Reg
it can be used with assign statements

## Wire
it can be used in the procedural blocks

## Logic 
- it is to serve as both reg and wire
- it can be used inside the Procedural block and with assign statements
- it can be used anywhere a net is used
- it can't be driven by multiple structural drivers
	This means that we can't use multiple assign statements on these or other such drivers 
	that is to say using the same variable multiple times on say both the RHS & LHS


### There are 2 types of Portmapping
- [ ] Nominal Mapping- .clk(clk)
- [ ] Positional Mapping- 
- Eg:
```verilog

  module adder (x,y,z,t);
  input logic x,y;
  output logic z,t;
  assign z= x^ y;
  assign t = x&y;
  endmodule
  module top(p,q,r,s);
  input logic p,q;
  output logic r,s;
  adder a1(p,q,r,s); -> this is nominal mapping
  adder a2(.q(y), .p(x), .s(t), .r(z)); -> this is positional Mapping
```  
  
### UDP and Built-in primitive 


## Procedural Blocks

==This block can not be nested== 
*But there is no limit to how many of them can be in between the module and endmodule*

| initial                                                         | always                                                      |
| --------------------------------------------------------------- | ----------------------------------------------------------- |
| it has no sensitivity list                                      | it has a sensitivity list                                   |
| -                                                               | it can be initiated without any inputs                      |
| it is a non synthesizable construct                             | it is a synthesizable construct                             |
| it is executed only once                                        | it can be executed as many times as the cases changes       |
| most cases we give the test cases in the in initial block       | we run most of the operations in this block                 |
| this block is ==always== scheduled to be  executed at runtime 0 | this block always depends on the event occurring to execute |

Eg:
```verilog
always
begin
y=a+b;
end
```

## Constant
SystemVerilog allows you to declare constant identifiers.
You can declare an identifier as constant by prefixing the usual identifier definition with the keyword const.
>[!Syntax]
>const bit [64] data_bus =h'asdf; //Not sure need to check

## Strings
The keyword is string.
SystemVerilog string type holds variable-length.
Dynamic
### String functions
#### getc(n)
it gets the ASCII value of the string that it is used on.
#### tolower
returns the string in lower-case format
s.tolower()
#### toupper
returns the string in upper-case format

#### Concatenation
we can use the { } for it

##### putc()
putc (m, c)
this task writes a byte c into a string at location m, that must be between 0 & the length as given by len.

#### len()
s.len()
This gives the length of the string, also other things 

#### substr(start, end)
this function extracts characters from location start to end 


# Array
https://www.edaplayground.com/x/qAKd

| Packed                                                                                          | Unpacked                                                                                                                                                                                                              |
| ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| bit [7:0]packed_arr;                                                                            | bit unpacked_arr [7:0];                                                                                                                                                                                               |
| if you have a 8 bit register at one address location it is fully used to store the entire array | each memory location stores one value of the array in a continuous fashion such that the 1st array element maybe at the address 1 then the rest of the array will follow it down by being stored in address 2 & so on |
| this is used when there is no concern of the memory resources                                   | this is used to make sure we make proper use of our memory resources, if scarce.                                                                                                                                      |

## Unpacked Array Storage
we can not slice the data in unpacked array 

`bit [7:0] b_unpacked [4]`;  -> this is an unpacked array of size 4 which has 8 elements in each place. {bad code}
Sample Code:
`bit [7:0] b_unpacked [4];
`input [31:0] din;
`din = b_unpacked;   // Compile error
*We can't assign unpacked arrays to packed arrays directly we will need to take each element and assign it using concatenation*
`din= {b_unpacked[3],b_unpacked[2],b_unpacked[1],b_unpacked[0]}

`bit b_packed [7:0]  [4]`;  -> this is a multidimensional array
the above is an unpacked array of 4 elements with each element of 8 bits
```verilog
module test;
integer arr1[3:0];
integer arr2[3:0];
integer arr3[3:0];
integer arr4[3:0];
integer arr5[3:0];
integer arr6[3:0];
integer mda [5:0]  [3:0];
integer i,j;
initial
begin
for (i=0; i < 4; i = i+1)
begin
arr1[i] = 5;
$display ("arr[%0d] = %0d", i, arr1[i]);
end
for (i=0; i < 6; i = i+1)
for (j=0; j < 4; j = j+1)
begin
mda [i] [j] = $random;
$display("mda[%0d][%0d] = %0d",i,j,mda[i][j]);
end
end
endmodule
```

## Initialising an array
Initialising at declaration 
`int arr1 [5] = '{10, 11, 12, 13, 14};
string str4 [4] = '{"hey", "this", "is", "sample"} 
## Packed Array Storage

`bit [3:0]  [7:0] arr`; -> here the 1st dimension is the # of elements and the second dimension is the size of the each element.
- it is possible to splice the array
Data is stored as a contiguous set of bits with no unused space.
***==Packed Array is accessed as a array and as a single vectors==***



# Types of Arrays
## Static Arrays vs Dynamic Arrays

| Static                               | Dynamic                                                    |
| ------------------------------------ | ---------------------------------------------------------- |
| It is fixed for the entirety of code | It's size is defined at run time while executing the code. |

## Static Arrays
Eg:
`int arr[0:3];` // 4 # of elements of int
`int c_style[4];` // 4 # of elements of int

*What happens if u read out of bound data?*
sv will return the default value for the array element type

$urandom -> this should give us unsigned numbers only according to the textbook, we see 
-ve numbers in the eda playground or the questa sim

$random & $urandom can only generate values with respect to the data types which will help define the range of the generator.


If we try to read an uninitialised array, it gives us default values. 


# Dynamic Arrays
there is 2 things in this which is compile time and run time.
- Compiling - checks for syntax & semantics and readily for simulation (it is a static world)
	- all the static data types will be allocated memory
	- all these will be till the end of the code where a $finish or end endmodule code segment is reached  

- Run time - it is the time after the code segment has finished compilation
	- all the dynamic data types will be allocated memory once you write them
		- **Available only in SV**
		- dynamic arrays
		- associative arrays
		- queues


## Why do we need Dynamic Data types?
It helps with **Real Time Application**.

A dynamic array is **one dimension** of an **unpacked array** whose size can be set or changed at run time.
the style of memory allocation is somewhat continuous.
`bit [7:0] d_arr[];` -> dynamic array declaration
`d_arr = new[4];` -> memory allocation
`d_arr = {0,1,2,3}` -> array initialisation
`d_arr = new[10]` -> increasing the size by overriding the old values
`d_arr = new[10](d_arr)` -> increasing the size while retaining the old values

Eg:
`module test;`
`//dynamic array declaration`
`bit [7:0] d_array1[];`
`int       d_array2[];`

`initial begin`
    `$display("Before Memory Allocation");`
    `$display("\tSize of d_array1 %0d",d_array1.size());`
    `$display("\tSize of d_array2 %0d",d_array2.size());`

    `//memory allocation`
    `d_array1 = new[4];`
    `d_array2 = new[6];`

    `$display("After Memory Allocation");`
    `$display("\tSize of d_array1 %0d",d_array1.size());`
    `$display("\tSize of d_array2 %0d",d_array2.size());`

    `//array initialization`
    `d_array1 = {0,1,2,3};`

    `foreach(d_array2[j])`
    `d_array2[j] = j;`
    `$display("--- d_array1 Values are ---");`

    `foreach(d_array1[i])`
    `$display("\td_aaray1[%0d] = %0d",i, d_array1[i]);`
    `$display("--------------------------------");`

    `$display("--- d_array2 Values are ---");`
    `foreach(d_array2[i])`
    `$display("\td_aaray2[%0d] = %0d",i, d_array2[i]);`
    `$display("--------------------------------");`
`end`
`endmodule`


## Write a SV code for the following description:
Create a Dynamic array named ArrayFull - it should contain 10 numbers.
create 2 more dynamic arrays - arrayeven & arrayodd - it should contain even numbers and odd numbers
### Solution
module eo;
int ArrayFull [ ];
int ArrayEven [ ];
int ArrayOdd [ ];

initial
begin
int ArrayFull = new[10];
int ArrayEven = new[10];
int ArrayOdd = new[10];

ArrayFull={1,2,3,4,5,6,7,8,9,10};

int i ,j ,k;
for( i=0; i<10; i++)
begin
	if (ArrayFull[i]%2 == 0)
		begin
			j=0;
			ArrayEven [j] = ArrayFull[i];
			j++;
		end
	else
		begin
			k=0;
			ArrayOdd[k] = ArrayFull[i];
			k++;
		end
	end
for(i=0;i<5;i++)
begin
$display("Odd array [%0d]=%0d",i,ArrayOdd[i]);
end

for(i=0;i<5;i++)
begin
$display("Even array [%0d]=%0d",i,ArrayEven[i]);
end
end 
endmodule




# Associative Arrays
They are similar to dynamic arrays
They are:
- Single Dimensional
- Unpacked
**the only difference is that the index is given a data type.**
Eg:
`int array2 [string];` -> this will create a array where the indices are strings with the data begin stored is of int data type.  

-The advantage of the associative is that the kind of data type which can be used for the indexing.
-it can also be used to store sparse and fullly spread out data in lesser memory resources.
- not truely continuous

it is not good for dense data.
when deleting in associative we need to give the correct index that we wish to delete

## Methods in Associative Array
.size  -> gives the size of the array
.delete() -> removes the specified index in the parenthesis from the array 
.exist() -> checks if the index that is there in the parenthesis is there in the array or not 
.first() -> this assigns which index will be the 1st element of the array
.next() -> 

# Queue
A queue is a variable-size, ordered collection of homogeneous elements.
-  like a dynamic array, queues can grow and shrink
- queue supports adding and removing data
```verilog
`bit queue_1[$];`
`int queue_2[$];`
`byte queue_3[$: 255];` -> queue of byte bounded with 256 entries
`string queue_4[$];`
```

## Queue Methods
.push_front() -> inserts element at the front of the queue
.push_back() -> inserts element at the back of the queue
.pop_front() -> removes & returns the 1st element
.pop_back() -> removes & returns the last element
.insert(index, data) -> the data can be another queue 

# Array Methods
There are many array methods that you can use on unpacked array

## Array reduction methods
A basic array reduction method takes an array and reduces it to a single value.

- .sum() -> adds all the elements in the array 
- .product() -> multiplies all the elements in the array 
- .and() -> performs an & operation on all the elements in the array
- .average ->
- .sub -> subtracts all the elements in the array

## Array locator Methods
-helps find say the largest values, smallest values or unique values.

 - .min -> smallest value is assigned somewhere
 - .max -> largest value is assigned somewhere
 - .unique -> this displays values only once or assigns it somewhere 

we can also perform some search operations
- .find_index with () 
- .find_first with ()
- .find_first_index with ()
- .find_last with ()
- .find_last_index with () 
-the parenthesis contains a argument which will be acting like the condition statement like less than this value or a specific value or something like that.
the different syntax's for the above are:
tq = d.find_first(item) with (item == 4)

- .shuffle()
- .sort()
- .rsort()
- .reverse()

# Typedef & Structures
## Typedef
User defined Data-types
Verilog doesn't allow users to define new data types
SystemVerilog provides a method to define new data types using typedef.

```verilog
typedef int unsigned uint;
unit a,b; // varibles a & b are of the user defined data type unit
```

```verilog
typedef bit[32] bit32;
bit32 data1, data2; //variables data1 & data2 are of the user defined data type bit32
```

Parameterised typedef
```verilog 
parameter OPSIZE = 8;
typedef logic [OPSIZE-1:0] opreg_t;

opreg_t op_a,op_b; // variables op_a & op_b are of the user defined data type opreg_t
```

### Parameter vs Constant
values can be changed in parameter to some extent but not in constant


User-Defined type in SystemVerilog

>[!Question]
>**Create the SystemVerilog code for the following requirements**
> - Create a user-defined type, nibble, of 4-bits
> - Create a real variable, r, & initialise it to 4.33
> - Create a short int variable, i_pack
> - Create an unpacked array, k, containing 4 elements of your user defined type nibble and initialise it to 4'h0, 4'hF, 4'hE & 4'hD
> - Print out k
> ```verilog
> 	module test;
> 	typedef bit[4] nibble;
> 	real r= 4.33;
> 	short int i_pack;
> 	bit k [4];
> 	assign k[0] =4'h0;
> 	assign k[1] =4'hF;
> 	assign k[2] =4'hE;
> 	assign k[3] =4'hD;
> 	int i;
> 	for(i=0; i < 4 ;i++)
> 	begin
> 		$display("the values =%0d, %0h", i, k[i]);
> 	end
> 	endmodule
> ``` 


## Structures
### Struct data type
- Structures allow multiple variables to be grouped together under a common name
- They are always **unpacked data types**
> [!Syntax]
> ```
> module test;
> struct{
> logic [32] data;
> bit [8] addr;
> } packet;
> 
> initial begin
> packet.data=32'hffff;
> packet.addr=8'd9;
> $display("Data: %0h, addr: %0d", data, addr);
> end 
> endmodule
> ```


#### Eg: // Code has errors need to be checked
struct {
logic [32] in1;
logic [8] in2;
opcode_t op_code;
}
typedef enum { NOP, ADD, SUB, MUL, DIV} opcode_t;

program test; // Not taught yet will be covered in the next class
initial begin
packet.in1 = 10;
packet.in2 = 20;
packet.opcode=ADD;
$display("in1=%0d in2=%0d opcode=%0s", packet.in1, packet.in2, packet.opcode name());
end
endprogram // will be taught in the next class


#### Unpacked Structures 
typedef struct {
logic [8] sa; //MSB
logic [8] da; 
logic [8] crc;
logic [8] payload; //LSB
} unpacked_st;

program test;
unpacke_st pkt;
initial begin 
pkt.sa=1; pkt.da=4; pkt.payload=8h'ffff;
pkt[8] =40;
end 
endprogram

>[!Note]
>Slicing on unpacked struct is not allowed, it will result in compile error.
>We should access only elements of struct, not individual fields.


### Packed Structures


## Unions 
- A union is a data type that represents a single piece of storage that can be accessed using one of the named member data types.
- **Only one of the data types in the union can be used at a time.**
- Unions are useful when you frequently need to read & write a register in several different formats.


#### Eg
module test;
union{ int j;
real f;
}un_var;

initial un_var.f=12.345 // Set value in floating point format
endmodule

>[!Note]
>Unions are used when you have to use the same memory location for two or more data members.
>Structs allocate enough memory space to store all of the fields in the struct.
>In union, the total memory space allocated is equal to the member with the largest size


# Type Conversions

In systemverilog casting means the conversions of one data type to another datatype.
There are 2 types of casting:
- Static Casting
- Dynamic Casting

## Static Casting
This occurs entirely in the compilation time.
A data type can be changed using a cast (') operation.

#### Eg:
```verilog
module casting;
real r_a;
int i_a;

initial begin
r_a = {2.1 * 3.2};
// real to integer conversion
i_a = int'(2.1 * 3.2); // or i_a = int'(r_a);
$display("real value in %f", r_a);
$display("int value in %f", i_a);
```



## Dynamic Casting
Use the dynamic cast when converting from a type with a larger number of values than the destination, such as int to an enumerated variable.
the operator is $cast.




# Testbench - Intro
The purpose of a testbench is to determine the correctness of the DUT/ DUV.
DUT -> Design under test
DUV -> Design under verification
This is accomplished by the following steps: -> this is the basic steps in the verification
- Generate stimulus 
- Apply stimulus to the DUT
- Capture the response
- Check for correctness
- Measure progress against the overall verification goals.

There are many types of testbenchs, some are:
- Simple testbench
- Self-checking testbench
- Layered testbench

***In HW lvl we test the circuit.*** 
***In SW lvl we verify the design.***

