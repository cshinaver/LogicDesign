`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    00:18:55 03/28/2007 
// Module Name:    control 
// Project Name: CSE30321
// Target Devices: xc3s100e-5vq100
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control(clk, start, reset, RF_W_addr, RF_W_wr, RF_Rp_addr, RF_Rp_rd, RF_Rq_addr, RF_Rq_rd, RF_s1, RF_s0, 
					alu_s1, alu_s0, RF_W_data, inst, I_rd, RF_Rp_zero, RF_Rp_neg, D_rd, D_wr, D_addr, pc_addr);

	input[15:0] inst;
	input clk, start, reset, RF_Rp_zero, RF_Rp_neg;
	output[3:0] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
	output RF_W_wr, RF_Rp_rd, RF_Rq_rd;
	output D_rd, D_wr, RF_s1, RF_s0, alu_s1, alu_s0, I_rd;
	output[7:0] D_addr, RF_W_data;
	output[15:0] pc_addr;
	
	wire[15:0] inst, pc_addr, jmp_addr, IR_out, jmp_addr_4, jmp_addr_8;
	wire[3:0] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
	wire[7:0] D_addr, RF_W_data;
	wire PC_clr, PC_ld, PC_inc, IR_ld;
	
	controller C(.clk(clk), 
					 .start(start), 
					 .reset(reset), 
					 .inst(IR_out), 
					 .RF_Rp_zero(RF_Rp_zero),
					 .RF_Rp_neg(RF_Rp_neg),
					 .RF_W_addr(RF_W_addr), 
					 .RF_W_wr(RF_W_wr), 
					 .RF_Rp_addr(RF_Rp_addr), 
					 .RF_Rp_rd(RF_Rp_rd), 
					 .RF_Rq_addr(RF_Rq_addr), 
					 .RF_Rq_rd(RF_Rq_rd),
					 .PC_clr(PC_clr), 
					 .PC_ld(PC_ld), 
					 .PC_inc(PC_inc), 
					 .I_rd(I_rd), 
					 .IR_ld(IR_ld), 
					 .D_rd(D_rd), 
					 .D_wr(D_wr),
					 .RF_s1(RF_s1), 
					 .RF_s0(RF_s0), 
					 .alu_s1(alu_s1), 
					 .alu_s0(alu_s0), 
					 .D_addr(D_addr), 
					 .RF_W_data(RF_W_data)
					);
	
	PC P(.clk(clk), 
		  .clr(PC_clr), 
		  .ld(PC_ld), 
		  .inc(PC_inc), 
		  .pc_addr(pc_addr), 
		  .jmp_addr(jmp_addr)
		 );
	
	JMP_addr J(.PC_in(pc_addr),
				  .IR_in({{8{IR_out[7]}}, IR_out[7:0]}), // Relative jump distance in the lower half byte of the instruction word, sign-extend to 16-bits
				  .jmp_out(jmp_addr)
				 );	 
	
	IR I(.clk(clk),
		  .reset(reset),
		  .data_in(inst),
		  .data_out(IR_out),
		  .ld(IR_ld)
		 );

endmodule
