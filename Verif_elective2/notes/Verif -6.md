# Randomization

## Randomization methods
- $urandom() & $random()
- $urandom_range() 
-  randomize
## Types of Randomization #edaplayground 
- [Pseudo Randomization](https://www.edaplayground.com/x/VPbN)
- [Randomization with seed](https://www.edaplayground.com/x/hGis)
- [Randomization with constraints](https://www.edaplayground.com/x/btHJ)
## Rand & Randc variables
- Variables declared with the rand keyword are standard random variables. Their values are randomly distributed over their range.
- Variables declared with the randc keyword are random-cyclic variables that cycle through all the values in a random permutation of their declared range.
### Randc

>[!Syntax]
``` sv
randc bit [2] y;
```

- The variable y can take on the values 0, 1, 2, & 3 { range of 0 to 3}.
- The basic idea is that the randc randomly iterates over all the values in the range & that no value is repeated within an iteration.
![[randc_variable.png.png]]

### Simple Constraints
https://www.edaplayground.com/x/nFrb  #edaplayground 


## TextBook Intro to Randomization:
- For larger designs, it gets increasingly harder to achieve complete coverage for the DUT.
- The solution then is to create test cases automatically using Constrained-Random-Tests(CRT). A directed test finds the bugs you think you have in your code, CRT finds all the possible bugs that are beyond the predictions, by using random stimulus.
- To make sure that even the random stimulus is of interest and not purely random we make it constrained random tests.



















 TB Eg: 6.5
```sv
class order_good;
  rand bit[7:0] lo,med,hi;
  constraint good { lo<med;
                   med<hi;}
endclass
module test;
order_good t;

initial
begin
t = new();
  repeat(3)
  begin
    t.randomize();
    $display(" %d %d %d",t.lo,t.med,t.hi ); 
end
end
endmodule
```