`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    datapath 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datapath(clk, reset, RF_W_addr, RF_W_wr, RF_Rp_addr, RF_Rp_rd, RF_Rq_addr, RF_Rq_rd, RF_s1, RF_s0, alu_s1, alu_s0,
					RF_W_data, R_data, RF_Rp_zero, RF_Rp_neg, rp);

	input [3:0] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
	input clk, reset, RF_s1, RF_s0, alu_s1, alu_s0, RF_W_wr, RF_Rp_rd, RF_Rq_rd;
	input[7:0] RF_W_data;
	input[15:0] R_data;
	output RF_Rp_zero, RF_Rp_neg;
	output[15:0] rp;
	
	wire[3:0] RF_Rq_addr, RF_Rp_addr, RF_W_addr;
	wire[15:0] rp, rq, mux_out, i0, R_data;
	wire[7:0] RF_W_data;

	
	
	
	
	RF R(.clk(clk),
		  .reset(reset),
		  .W_addr(RF_W_addr), 
		  .W_wr(RF_W_wr), 
		  .Rp_addr(RF_Rp_addr), 
		  .Rp_rd(RF_Rp_rd),
		  .Rq_addr(RF_Rq_addr), 
		  .Rq_rd(RF_Rq_rd), 
		  .Rp_data(rp), 
		  .Rq_data(rq), 
		  .W_data(mux_out)
	);
	
	alu A(.A(rp), 
			.B(rq), 
			.D(i0), 
			.s0(alu_s0), 
			.s1(alu_s1), 
			.Z(RF_Rp_zero),
			.N(RF_Rp_neg)
	);
	
	mux16_3x1 M(.i0(i0),
					.i1(R_data), 
					.i2(RF_W_data),
					.s0(RF_s0),
					.s1(RF_s1),
					.d(mux_out)
				  );
endmodule
