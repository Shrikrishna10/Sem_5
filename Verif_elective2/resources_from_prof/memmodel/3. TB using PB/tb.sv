program testbench (clk,tb_reset,tb_wr,tb_rd,tb_addr,tb_wdata,tb_rdata,response);

parameter reg[15:0] ADDR_WIDTH = 4;
parameter reg[15:0] DATA_WIDTH = 32;
parameter reg[15:0] MEM_SIZE   = 16;

input clk;
output tb_reset;
output tb_wr; // for write wr = 1;
output tb_rd; // for write wr = 1;
output [ADDR_WIDTH-1:0] tb_addr;
output [DATA_WIDTH-1:0] tb_wdata;

input [DATA_WIDTH-1:0] tb_rdata;
input response;

reg tb_reset;
reg tb_wr; // for write wr = 1;
reg tb_rd; // for write wr = 1;
reg [ADDR_WIDTH-1:0] tb_addr;
reg [DATA_WIDTH-1:0] tb_wdata;

reg  [DATA_WIDTH-1:0] ref_arr [MEM_SIZE]; //stimulus driven into DUT, Expected data
reg  [DATA_WIDTH-1:0] got_arr [MEM_SIZE]; // Respopnse from DUT , actual data

// Below two variables maintains count of how many write/read operations matched and missmatched
bit[4:0] matched, mis_matched;

			
initial 

begin

	$display ("[tb] simulation started at time =%0t", $time);
	tb_reset = 0;
	reset();
	write();
	repeat(2) @(posedge clk);
	read();
	repeat(2) @(posedge clk);
	compare();
	result();
	#1 $display ("[tb] simulation ended at time =%0t", $time);
	
end
	
task reset();
#1
$display ("[tb] Applying reset at time = %0t", $time);
tb_reset = 1;
#3
tb_reset = 0;
$display ("[tb] DUT is out of reset at time = %0t", $time);	
endtask

task write ();
reg [31:0] wdata;
tb_wr <= 1; // write mode

for(int i =0; i < MEM_SIZE; i++) begin
	@(posedge clk);
	tb_addr <= i;
	wdata = $urandom_range(10,999);
	tb_wdata <= wdata;
	$display ("[tb] Write addr = %0d wdata = %0d at time = %0t", i,wdata,$time);
	ref_arr[i] = wdata; // strore the reference data
	end
	
   @(posedge clk);
   tb_wr <= 1'b0;
   
endtask
	
task read ();
reg [4:0] i;

for (i =0; i<MEM_SIZE; i = i+1) 

begin
	@(posedge clk)
	tb_rd <= 1;
	tb_addr <= i;
	@(tb_rdata);
	got_arr[tb_addr] = tb_rdata; // store the received data from DUT
	$display ("[tb] read addr = %0d rdata = %0d at time = %0t", tb_addr,tb_rdata,$time);
end

tb_rd <= 1'b0;
endtask

task compare ();

for (int i = 0; i <MEM_SIZE; i = i+1) 
begin
	if (ref_arr[i] == got_arr[i])
	matched++;
	else
	begin
	mis_matched++;
	$display ("[ERROR] *** Data Mismatch addr = %0d  expected = %0d  received = %0d ***",i, ref_arr[i],got_arr[i]);
	end
end
endtask

task result ();

$display ("\n************************************Results*****************************");

if (matched == MEM_SIZE && mis_matched == 0) begin
$display ("[Info] Matched = %0d Mis_matched = %0d ", matched,mis_matched);
$display ("[Info] ******** TEST PASSED VINAY **********\n");
end

else

$display ("[FATAL] ******** TEST FAILED  VINAY matched = %0d mis_matched = %0d *******",matched,mis_matched);

$display ("****************************************\n");

endtask
endprogram

	


				