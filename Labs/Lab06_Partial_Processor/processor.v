`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    processor 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module processor(clk, start, reset);
	input clk, start, reset;
	wire[3:0] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
	wire[7:0] RF_W_data, D_addr;
	wire[15:0] D_R_data, D_W_data, I_R_data, pc_addr;
	wire RF_W_wr, RF_Rp_rd, RF_Rq_rd, I_rd, D_rd, D_wr, RF_s1, RF_s0, alu_s1, alu_s0, RF_Rp_zero, RF_Rp_neg;
	parameter memfile_inst = "instruction_memory_contents.txt";
	parameter memfile_data = "data_memory_contents.txt";
	
	
	
	
	
	datapath D(.clk(clk), 
				  .RF_W_addr(RF_W_addr),
				  .RF_W_wr(RF_W_wr), 
				  .RF_Rp_addr(RF_Rp_addr), 
				  .RF_Rp_rd(RF_Rp_rd), 
				  .RF_Rq_addr(RF_Rq_addr), 
				  .RF_Rq_rd(RF_Rq_rd), 
				  .RF_s1(RF_s1), 
				  .RF_s0(RF_s0), 
				  .alu_s1(alu_s1), 
				  .alu_s0(alu_s0),
				  .RF_W_data(RF_W_data),
				  .R_data(D_R_data),
				  .RF_Rp_zero(RF_Rp_zero),
				  .RF_Rp_neg(RF_Rp_neg),
				  .rp(D_W_data),
				  .reset(reset)
	          );
				 
	control C(.clk(clk),
				 .start(start),
				 .reset(reset),
				 .RF_W_addr(RF_W_addr),
				 .RF_W_wr(RF_W_wr),
				 .RF_Rp_addr(RF_Rp_addr),
				 .RF_Rp_rd(RF_Rp_rd),
				 .RF_Rq_addr(RF_Rq_addr),
				 .RF_Rq_rd(RF_Rq_rd), 
				 .RF_s1(RF_s1),
				 .RF_s0(RF_s0),
				 .alu_s1(alu_s1),
				 .alu_s0(alu_s0),
				 .RF_W_data(RF_W_data),
				 .inst(I_R_data),
				 .I_rd(I_rd),
				 .RF_Rp_zero(RF_Rp_zero),
				 .RF_Rp_neg(RF_Rp_neg),
				 .D_rd(D_rd),
				 .D_wr(D_wr),
				 .D_addr(D_addr),
				 .pc_addr(pc_addr)
	         );
					
	// Data RAM memory
	data_mem #(memfile_data) DM (
		.clka(clk),
		.dina(D_W_data), 
		.addra(D_addr), 
		.wea(D_wr),
		.douta(D_R_data)
	  );
	
	// Instruction ROM memory
	inst_mem #(memfile_inst) IM (
		.clka(clk),
		.addra(pc_addr),
		.douta(I_R_data)
	  ); 
endmodule
