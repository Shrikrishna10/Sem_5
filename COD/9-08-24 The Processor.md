# Non-Pipelined Architecture

## Single Cycle Risc-V Processor 
the basic implementation of the Risc-V subset, including the necessary multipliers and Control lines

For arithmetic calculations, memory access is idle. ( ops like add immediate & R)

## Little Indian & Big Indian
In Little Indian the MSB is the lowest bit, whereas in Big Indian the MSB is the highest bit?


Load is the only operation that uses all the 5 instructions fetching, decoding, execution, memory access, write back.

Add uses only fetching, decoding, execution, write back 