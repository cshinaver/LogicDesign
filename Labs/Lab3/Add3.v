module Add3(A, S);
	input [3:0] A; // Binary nibble in
	output [3:0] S; // in+3 out, except for inputs 10=< (dec) zero out
	reg [3:0] S;
	
	always @ (A)
		case (A)
			4'b0000: S <= 4'b0000;
			4'b0001: S <= 4'b0001;
			4'b0010: S <= 4'b0010;
			4'b0011: S <= 4'b0011;
			4'b0100: S <= 4'b0100;
			4'b0101: S <= 4'b1000;
			4'b0110: S <= 4'b1001;
			4'b0111: S <= 4'b1010;
			4'b1000: S <= 4'b1011;
			4'b1001: S <= 4'b1100;
			default: S <= 4'b0000; // Inputs 10-15(dec) produce zero
		endcase
endmodule

// Separate output bits
module Add3b(a0,a1,a2,a3, s0,s1,s2,s3);
//module Add3b(a3,a2,a1,a0, s3,s2,s1,s0);
//module Add3(A, S);
	//input [3:0] A; // Binary nibble in
	//output [3:0] S; // in+3 out, except for inputs 10=< (dec) zero out
	input a3, a2, a1, a0; // Binary nibble in
	output s3, s2, s1, s0; // in+3 out, except for inputs 10=< (dec) zero out
	wire [3:0] A;
	reg [3:0] S;
	assign A = {a3,a2,a1,a0};
	assign {s3,s2,s1,s0} = S;
	
	always @ (A)
		case (A)
			4'b0000: S <= 4'b0000;
			4'b0001: S <= 4'b0001;
			4'b0010: S <= 4'b0010;
			4'b0011: S <= 4'b0011;
			4'b0100: S <= 4'b0100;
			4'b0101: S <= 4'b1000;
			4'b0110: S <= 4'b1001;
			4'b0111: S <= 4'b1010;
			4'b1000: S <= 4'b1011;
			4'b1001: S <= 4'b1100;
			default: S <= 4'b0000; // Inputs 10-15(dec) produce zero
		endcase
endmodule