module Bin2BCD4(inBin, tens, ones);
//module Bin2BCD(inBin, outBCD);
	input [3:0] inBin; // 4-bit binary input
	output [3:0] tens, ones;
	//output [7:0] outBCD;
	wire [3:0] A0in, A1in, A2in; // Wiring for Add3 unit inputs
	wire [3:0] A0out, A1out, A2out; // Wiring for Add3 unit outputs
	
	// 4-bit binary to BCD conversion requires 1 Add3 unit
	Add3 Add3Digit0(.A (A0in), .S (A0out));

	// Connect the Add3 unit, 4-bit busses
	assign A0in = {1'b0, inBin[3:1]};
	
	// Combine the BCD digits
	assign tens = {3'b000, A0out[3]};
	assign ones = {A0out[2:0], inBin[0]};
endmodule

module Bin2BCD8(inBin, hundreds, tens, ones);
//module Bin2BCD(inBin, outBCD);
	input [7:0] inBin; // 8-bit binary input
	output [3:0] hundreds, tens, ones;
	//output [11:0] outBCD;
	wire [3:0] A0in, A1in, A2in, A3in, A4in, A5in, A6in; // Wiring for Add3 unit inputs
	wire [3:0] A0out, A1out, A2out, A3out, A4out, A5out, A6out; // Wiring for Add3 unit outputs
	// wire [3:0] hundreds, tens, ones;
	
	// 8-bit binary to BCD conversion requires 7 Add3 units
	Add3 Add3Digit0(.A (A0in), .S (A0out));
	Add3 Add3Digit1(.A (A1in), .S (A1out));
	Add3 Add3Digit2(.A (A2in), .S (A2out));	
	Add3 Add3Digit3(.A (A3in), .S (A3out));
	Add3 Add3Digit4(.A (A4in), .S (A4out));
	Add3 Add3Digit5(.A (A5in), .S (A5out));
	Add3 Add3Digit6(.A (A6in), .S (A6out));

	// Connect the Add3 units, 4-bit busses
	assign A0in = {1'b0, inBin[7:5]};
	assign A1in = {A0out[2:0], inBin[4]};
	assign A2in = {A1out[2:0], inBin[3]};
	assign A3in = {A2out[2:0], inBin[2]};
	assign A4in = {A3out[2:0], inBin[1]};
	assign A5in = {1'b0, A0out[3], A1out[3], A2out[3]};
	assign A6in = {A5out[2:0], A3out[3]};
	
	// Combine the BCD digits
	assign hundreds = {2'b00, A5out[3], A6out[3]};
	assign tens = {A6out[2:0], A4out[3]};
	assign ones = {A4out[2:0], inBin[0]};
endmodule

module Bin2BCD16(inBin, thousands10, thousands, hundreds,tens, ones);
	input [15:0] inBin; // 16-bit binary input
	output [3:0] thousands10, thousands, hundreds, tens, ones; // BCD digits
	
	// Outputs of each Add3 unit, 34 units
	wire [3:0] A00out,A01out,A02out,A03out,A04out,A05out,A06out,A07out,A08out,A09out;
	wire [3:0] A10out,A11out,A12out,A13out,A14out,A15out,A16out,A17out,A18out,A19out; 
	wire [3:0] A20out,A21out,A22out,A23out,A24out,A25out,A26out,A27out,A28out,A29out; 
	wire [3:0] A30out,A31out,A32out,A33out; 
	
	// Thirteen wiring levels, each has 20 wires
	wire [19:0] w00,w01,w02,w03,w04,w05,w06,w07,w08,w09,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19;
	
	// Inputs
	assign w00 = {4'b0000, inBin[15:0]};
	
	// Level 0
	Add3 Add3Digit00(.A (w00[16:13]), .S (A00out));
	assign w01 = {w00[19:17], A00out, w00[12:0]};
	
	// Level 01
	Add3 Add3Digit01(.A (w01[15:12]), .S (A01out));
	assign w02 = {w01[19:16], A01out, w01[11:0]};
	
	// Level 02
	Add3 Add3Digit02(.A (w02[14:11]), .S (A02out));
	assign w03 = {w02[19:15], A02out, w02[10:0]};
	
	// Level 03
	Add3 Add3Digit13(.A (w03[17:14]), .S (A13out));
	Add3 Add3Digit03(.A (w03[13:10]), .S (A03out));
	assign w04 = {w03[19:18], A13out, A03out, w03[9:0]};
		
	// Level 04
	Add3 Add3Digit14(.A (w04[16:13]), .S (A14out));
	Add3 Add3Digit04(.A (w04[12:09]), .S (A04out));
	assign w05 = {w04[19:17], A14out, A04out, w04[8:0]};
	
	// Level 05
	Add3 Add3Digit15(.A (w05[15:12]), .S (A15out));
	Add3 Add3Digit05(.A (w05[11:08]), .S (A05out));
	assign w06 = {w05[19:16], A15out, A05out, w05[7:0]};
	
	// Level 06
	Add3 Add3Digit23(.A (w06[18:15]), .S (A23out));
	Add3 Add3Digit16(.A (w06[14:11]), .S (A16out));
	Add3 Add3Digit06(.A (w06[10:7]), .S (A06out));
	assign w07 = {w06[19], A23out, A16out, A06out, w06[6:0]};
	
	// Level 07
	Add3 Add3Digit24(.A (w07[17:14]), .S (A24out));
	Add3 Add3Digit17(.A (w07[13:10]), .S (A17out));
	Add3 Add3Digit07(.A (w07[9:6]), .S (A07out));
	assign w08 = {w07[19:18], A24out, A17out, A07out, w07[5:0]};
	
	// Level 08
	Add3 Add3Digit25(.A (w08[16:13]), .S (A25out));
	Add3 Add3Digit18(.A (w08[12:9]), .S (A18out));
	Add3 Add3Digit08(.A (w08[8:5]), .S (A08out));
	assign w09 = {w08[19:17], A25out, A18out, A08out, w08[4:0]};
	
	// Level 09
	Add3 Add3Digit30(.A (w09[19:16]), .S (A30out));
	Add3 Add3Digit26(.A (w09[15:12]), .S (A26out));
	Add3 Add3Digit19(.A (w09[11:8]), .S (A19out));
	Add3 Add3Digit09(.A (w09[7:4]), .S (A09out));
	assign w10 = {A30out, A26out, A19out, A09out, w09[3:0]};
	
	// Level 10
	Add3 Add3Digit31(.A (w10[18:15]), .S (A31out));
	Add3 Add3Digit27(.A (w10[14:11]), .S (A27out));
	Add3 Add3Digit20(.A (w10[10:7]), .S (A20out));
	Add3 Add3Digit10(.A (w10[6:3]), .S (A10out));
	assign w11 = {w10[19], A31out, A27out, A20out, A10out, w10[2:0]};
	
	// Level 11
	Add3 Add3Digit32(.A (w11[17:14]), .S (A32out));
	Add3 Add3Digit28(.A (w11[13:10]), .S (A28out));
	Add3 Add3Digit21(.A (w11[9:6]), .S (A21out));
	Add3 Add3Digit11(.A (w11[5:2]), .S (A11out));
	assign w12 = {w11[19:18], A32out, A28out, A21out, A11out, w11[1:0]};
	
	// Level 12
	Add3 Add3Digit33(.A (w12[16:13]), .S (A33out));	
	Add3 Add3Digit29(.A (w12[12:9]), .S (A29out));
	Add3 Add3Digit22(.A (w12[8:5]), .S (A22out));
	Add3 Add3Digit12(.A (w12[4:1]), .S (A12out));
	assign w13 = {w12[19:17], A33out, A29out, A22out, A12out, w12[0]};

	// Outputs,the BCD digits
	assign thousands10 = w13[19:16];
	assign thousands = w13[15:12];
	assign hundreds = w13[11:8];
	assign tens = w13[7:4];
	assign ones = w13[3:0];
endmodule
