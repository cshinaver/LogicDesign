`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    PC 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PC(clk, clr, ld, inc, pc_addr, jmp_addr);
	input clk, clr, ld, inc;
	input[15:0] jmp_addr;
	
	output[15:0] pc_addr;
	reg[15:0] pc;
	
	always @(posedge clk) begin
		if(clr) pc <= 16'h0000;
		if(inc) pc <= pc + 16'h0001;
		if(ld) pc <= jmp_addr;
	end
	
	assign pc_addr = pc;
endmodule
