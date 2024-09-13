module top;
  logic[1:0] grant,request;
  bit clk;
  always #50 clk=~clk;
  arb_with_port a1(grant,request,rst,clk);
  testy t1(grant,request,rst,clk);
endmodule
