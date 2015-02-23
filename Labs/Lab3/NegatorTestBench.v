`timescale 1ns/1ns
module NegatorTestBench();
	reg [6:0] a;
	wire [7:0] b;
	
	Negator neg(a, b);
	initial begin
		a = 7'b0000011; #20;
		a = 7'b1010110; #20;
	end
endmodule
	
	