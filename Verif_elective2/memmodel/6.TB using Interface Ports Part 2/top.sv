interface memory_if (clk); 

parameter reg[15:0] ADDR_WIDTH = 4;
parameter reg[15:0] DATA_WIDTH = 32;
parameter reg[15:0] MEM_SIZE   = 16;

input clk;
reg reset;
reg wr; // for write wr = 1;
reg rd; // for write wr = 1;
reg [ADDR_WIDTH-1:0] addr;
reg [DATA_WIDTH-1:0] wdata;
wire [DATA_WIDTH-1:0] rdata;
reg response;

endinterface

module top;

reg clk;
initial clk =0;
always #5 clk = !clk;

memory_if mem_if_inst(clk); 

memory_rtl DUT (mem_if_inst);
				
testbench TEST (mem_if_inst);
				
endmodule
								