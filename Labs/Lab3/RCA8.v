module RCA8(a, b, s);
	input [7:0] a, b;
	output [8:0] s;
	wire [6:0] c;
	
	FullAdder fa0(a[0], b[0], 1'b0, c[0], s[0]);
	FullAdder fa1(a[1], b[1], c[0], c[1], s[1]);
	FullAdder fa2(a[2], b[2], c[1], c[2], s[2]);
	FullAdder fa3(a[3], b[3], c[2], c[3], s[3]);
	FullAdder fa4(a[4], b[4], c[3], c[4], s[4]);
	FullAdder fa5(a[5], b[5], c[4], c[5], s[5]);
	FullAdder fa6(a[6], b[6], c[5], c[6], s[6]);
	FullAdder fa7(a[7], b[7], c[6], s[8], s[7]);

endmodule
