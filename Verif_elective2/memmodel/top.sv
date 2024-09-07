module top;

parameter reg[15:0] ADDR_WIDTH = 4;
parameter reg[15:0] DATA_WIDTH = 32;
parameter reg[15:0] MEM_SIZE   = 16;

reg clk,tb_reset;
reg tb_wr; // for write wr = 1;
reg tb_rd; // for write wr = 1;
reg [ADDR_WIDTH-1:0] tb_addr;
reg [DATA_WIDTH-1:0] tb_wdata;

wire [DATA_WIDTH-1:0] tb_rdata;
wire response;


initial clk =0;
always #5 clk = !clk;

memory_rtl DUT (.clk(clk),
				.reset(tb_reset),
				.wr(tb_wr),
				.rd(tb_rd),
				.addr(tb_addr),
				.wdata(tb_wdata),
				.rdata(tb_rdata),
				.response(response)
				);
				
testbench TEST (.clk(clk),
				.tb_reset(tb_reset),
				.tb_wr(tb_wr),
				.tb_rd(tb_rd),
				.tb_addr(tb_addr),
				.tb_wdata(tb_wdata),
				.tb_rdata(tb_rdata),
				.response(response)
				);
				
endmodule
								