`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    mux16_3x1 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux16_3x1(i0, i1, i2, s0, s1, d);
	input s0, s1;
	input[15:0] i0, i1;
	input[7:0] i2; // Input for 8-bit immediate constant
	output reg[15:0] d;
	
	always@(i0, i1, i2, s0, s1) begin
		if(s0 == 0 && s1 == 0) d = i0;
		else if(s0 == 1 && s1 == 0) d = i1;
		else if(s0 == 0 && s1 == 1) d = i2; // 8-bit immediate, implicitly set upper byte to zero
		else d = 16'b0000; // (s0 == 1 && s1 == 1) Should NOT occur
	end
endmodule
