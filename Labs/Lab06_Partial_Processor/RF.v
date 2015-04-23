`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    RF 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RF(clk, reset, W_addr, W_wr, Rp_addr, Rp_rd, Rq_addr, Rq_rd, Rp_data, Rq_data, W_data);
	input clk, reset, W_wr, Rp_rd, Rq_rd;
	input[15:0] W_data;
	input[3:0] W_addr, Rp_addr, Rq_addr;
	output [15:0] Rp_data, Rq_data;
	
	reg[15:0] rfile[15:0];
	reg[31:0] i; // Index variable //reg[4:0] i;
	
	always @(posedge clk) begin
		if(reset == 1) begin
			for(i = 0; i < 16; i = i + 1) begin
				rfile[i] = 0;
			end
		end
		
		if(W_wr == 1) rfile[W_addr] <= W_data;
	end
	
	assign Rp_data = rfile[Rp_addr];
	assign Rq_data = rfile[Rq_addr];
endmodule
