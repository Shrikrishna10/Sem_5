module memory_rtl (memory_if dif);

//Synchronous write read memory_rtl
parameter reg[15:0] ADDR_WIDTH = 4;
parameter reg[15:0] DATA_WIDTH = 32;
parameter reg[15:0] MEM_SIZE   = 16;


reg  [DATA_WIDTH-1:0] mem [MEM_SIZE];
reg  [DATA_WIDTH-1:0] data_out;

reg  out_enable; //controls when to pass read data on rdata pin

//if rd = 0 rdata should be in hign impedance state
//if rd = 1 rdata should be content of memory with given address

assign dif.rdata = out_enable ? data_out : 'bz;

//asynchronous reset and synchronous write
always @ (posedge dif.clk or posedge dif.reset)
begin
	if (dif.reset) 
	
	begin
		for (int i =0; i<MEM_SIZE; i++)
		mem[i] <= 'b0;
	end
	
	else if (dif.wr) 
	
	begin
	  mem[dif.addr] <= dif.wdata;
	  dif.response <= 1'b1;
	end
	
	else
	
	dif.response <= 1'b0;
	
end // end of write

//Synchronous Read
always @ (posedge dif.clk)
begin
	if (dif.rd ==1) 
	
	begin
	  data_out <= mem[dif.addr];
	  out_enable <= 1'b1;
	 end
	  
	else
	
	out_enable <= 1'b0;
	
end // end_of_read

endmodule

/*
Write a self checking testbench

	Write a task to apply reset to DUT
	Write a task to write to all 16 locations
	Write a task to read from all 16 locations
	Write comparison task to compare write data and read data
	Print test PASS or FAIL with the help of results from compare method
	
For Example

Write : wr = 1, addr = 3, wdata = 50
Read  : rd = 1, addr = 3, then you should see value 50 on rdata
*/




