module fa1(input a, b, cin, output y, out);
wire p, g;

assign p = a^b;
assign g = a&b;

assign s = p^cin;
assign cout = g | (p&cin);
endmodule
