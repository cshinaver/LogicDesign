`timescale 1ns/1ns
module AbsSignTestBench();
	reg [6:0] a;
	wire sign;
	wire o;
	
	AbsSign absS(a, o, sign);
	
	initial begin
		a = 7'd5; #20;
		b = 7'd-5; #20;
	end
endmodule
	