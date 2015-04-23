`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    alu 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(A, B, D, s0, s1, Z, N);
	input[15:0] A, B;
	//input signed[15:0] A, B; // This would make relational operators automatically use signed comparison
	input s0, s1;
	output reg[15:0] D;
	output reg Z, N;
	
	
	always @(A, B, s0, s1) begin
		// Add
		if(s0 == 1 && s1 == 0) D = A + B;

		// Sub
		else if(s0 == 0 && s1 == 1) D = A - B;

		// Pass A
		else if(s0 == 0 && s1 == 0) D = A;
		
		// Pass B
		else if(s0 == 1 && s1 == 1) D = B;
		
		// Should NOT happen
		else D = 16'h0000;
		
		// Set zero_flag
		if(A == 0) Z = 1;
		else Z = 0;
		
		// Set negative_flag
		//if(A[15] == 1'b1)	// The easy way
		//if(A < 0)				// Relational operator which requires signed type for A
		if($signed(A) < 0)	// Relational operator with explicit signed interpretation
			N = 1;
		else N = 0;
	end
endmodule
