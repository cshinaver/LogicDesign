`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    IR 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IR(clk, reset, data_in, data_out, ld);
	input clk, reset, ld;
	input[15:0] data_in;
	output[15:0] data_out;
	
	reg[15:0] data;
	
	always @(posedge clk) begin
		if(reset == 1) data <= 16'h0000;
		if(ld == 1) data <= data_in;
	end
	
	assign data_out = data;
endmodule