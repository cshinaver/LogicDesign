`timescale 1ns/1ns
module AbsSignTestBench();
	reg [6:0] a;
	wire sign;
	wire [7:0] o;
	
	AbsSign absS(a, o, sign);
	
	initial begin
		a = 7'd5; #20;
		a = -7'd5; #20;
	end
endmodule
	