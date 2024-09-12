interface memory_if (clk); //step 1

parameter reg[15:0] ADDR_WIDTH = 4;
parameter reg[15:0] DATA_WIDTH = 32;
parameter reg[15:0] MEM_SIZE   = 16;

input clk;
reg tb_reset;
reg tb_wr; // for write wr = 1;
reg tb_rd; // for write wr = 1;
reg [ADDR_WIDTH-1:0] tb_addr;
reg [DATA_WIDTH-1:0] tb_wdata;

wire [DATA_WIDTH-1:0] tb_rdata;
wire response;

endinterface

module top;

reg clk;
initial clk =0;
always #5 clk = !clk;

memory_if mem_if_inst(clk); // step 2

memory_rtl DUT (.clk(mem_if_inst.clk),
				.reset(mem_if_inst.tb_reset),
				.wr(mem_if_inst.tb_wr),
				.rd(mem_if_inst.tb_rd),
				.addr(mem_if_inst.tb_addr),
				.wdata(mem_if_inst.tb_wdata),
				.rdata(mem_if_inst.tb_rdata),
				.response(mem_if_inst.response)
				);
				
testbench TEST (mem_if_inst);
				
endmodule
								