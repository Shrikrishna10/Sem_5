// Code your design here
module arb_with_port (output logic [2] grant, input logic [2] request, input rst, clk);
  always @(posedge clk or posedge rst) begin
    if (rst)
      grant <= 2'b00;
    else if (request [0]) // High Priority
      grant <=2b'01;
    else if (request [1]) // Low Priority
      grant <= 2'b10;
    else 
      grant <='0;
  end
endmodule
