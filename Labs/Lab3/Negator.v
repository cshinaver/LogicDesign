module Negator(a, b);

	input [6:0] a;
	output [7:0] b;
	wire c;
	
	RCA8 rca8(~{a[6], a}, 8'b1, {c, b});
	
endmodule
	
