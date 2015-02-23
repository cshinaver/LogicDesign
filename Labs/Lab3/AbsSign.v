module AbsSign(a, b, sign);
	input [6:0] a;
	output [7:0] b;
	output sign;
	wire sel;
	wire [7:0] negA; 
	
	assign sel = a[6];

	Negator neg(a, negA);
	
	BusMux bm({sel, a}, negA, sel, b);
	assign sign = sel;
	
endmodule

	
	