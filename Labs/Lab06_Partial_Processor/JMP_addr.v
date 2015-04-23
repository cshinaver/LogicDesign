`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    JMP_addr 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module JMP_addr(PC_in, IR_in, jmp_out);
	input[15:0] PC_in;
	input[15:0] IR_in;
	output reg[15:0] jmp_out;
	
	always @(PC_in, IR_in) begin
		//if number is negative, convert from 2's complement and subtract
		if(IR_in[15] == 1) begin
			jmp_out = PC_in - (~IR_in + 16'h0001) - 16'h0001;
		end
		else begin
			jmp_out = PC_in + IR_in - 16'h0001;
		end
	end
endmodule
