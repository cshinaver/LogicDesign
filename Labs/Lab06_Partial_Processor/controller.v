`timescale 1ns/1ns // Time unit/precision
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Notre Dame
// 
// Create Date:    04/05/2014
// Module Name:    Controller 
// Project Name: CSE20221
// Target Devices: 
// Description: Implementation of the Six-instruction processor from
// Frank Vahid's Digital Design, Ch. 8 
//
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module controller(clk, start, reset, inst, RF_Rp_zero, RF_Rp_neg, RF_W_addr, RF_W_wr, RF_Rp_addr, RF_Rp_rd, RF_Rq_addr, RF_Rq_rd,
						PC_clr, PC_ld, PC_inc, I_rd, IR_ld, D_rd, D_wr, RF_s1, RF_s0, alu_s1, alu_s0, D_addr, RF_W_data);
	
	// Inputs
	input[15:0] inst;
	input clk, start, reset, RF_Rp_zero, RF_Rp_neg;
	
	// Outputs
	output reg RF_W_wr, RF_Rp_rd, RF_Rq_rd, PC_clr, PC_ld, PC_inc, I_rd, IR_ld, D_rd, D_wr, RF_s1, RF_s0, alu_s1, alu_s0;
	output reg[3:0] RF_W_addr, RF_Rp_addr, RF_Rq_addr;
	output reg[7:0] D_addr, RF_W_data;
		
	reg[4:0] state, next_state;
	parameter	idle = 0, init = 1, fetch = 2, decode = 3, load = 4,
					store = 5, add = 6, ldc = 7, sub = 8, jmpz = 9, jmpzjmp = 10, fetch_wait = 11, load_wait = 12,
					jmp = 13, jmpn = 14,	jmpnjmp = 15, loadr = 16, loadr_wait = 17, storer = 18;
	
	parameter op_load = 0, op_store = 1, op_add = 2, op_ldc = 3, op_sub = 4, op_jmpz = 5,
				 op_jmp = 6, op_jmpn = 7, op_loadr = 8, op_storer = 9;

	// Debug labels to display state names in simulation (ASCII)
	reg [10*8-1:0] state_text;
	always@(state) begin 
		case(state)
			idle: 		state_text = "idle      ";
			init: 		state_text = "init      ";
			fetch: 		state_text = "fetch     ";
			decode: 		state_text = "decode    ";
			load: 		state_text = "load      ";
			store: 		state_text = "store     ";
			add: 			state_text = "add       ";
			ldc: 			state_text = "ldc       ";
			sub: 			state_text = "sub       ";
			jmpz: 		state_text = "jmpz      ";
			jmpzjmp: 	state_text = "jmpzjmp   ";
			fetch_wait:	state_text = "fetch_wait";
			load_wait: 	state_text = "load_wait ";
			jmp: 			state_text = "jmp       ";
			jmpn: 		state_text = "jmpn      ";
			jmpnjmp: 	state_text = "jmpnjmp   ";
			loadr: 		state_text = "loadr     ";
			loadr_wait: state_text = "loadr_wait";
			storer: 		state_text = "storer    ";
			default: 	state_text = "UNDEFINED ";
		endcase
	end	

	// Debug labels to display op codes in simulation (ASCII)
	reg [10*8-1:0] opcode_text;
	always@(inst[15:12]) begin 
		case(inst[15:12])
			op_load: 	opcode_text = "op_load   ";
			op_store:	opcode_text = "op_store  ";
			op_add: 		opcode_text = "op_add    ";
			op_ldc: 		opcode_text = "op_ldc    ";
			op_sub: 		opcode_text = "op_sub    ";
			op_jmpz: 	opcode_text = "op_jmpz   ";
			op_jmp:		opcode_text = "op_jmp    ";
			op_jmpn:		opcode_text = "op_jmpn   ";
			op_loadr:	opcode_text = "op_loadr  ";
			op_storer:	opcode_text = "op_storer ";
			default: 	opcode_text = "UNDEFINED ";
		endcase
	end		
		
	// Update state register on rising clock edge
	always @(posedge clk) begin
		if(reset) state <= idle; // Synchronous reset
		else state <= next_state;
	end
	
	// Next state and output logic
	// ... Combinatorial logic
	// ... except for the latches generated for the address and data buses (required behavior)
	always @* begin
		
		// Control signals default to zero, if not otherwise set in the following case statement
		PC_clr = 1'b0;	PC_ld = 1'b0; PC_inc = 1'b0;
		RF_W_wr = 1'b0; RF_Rp_rd = 1'b0;	RF_Rq_rd = 1'b0;
		I_rd = 1'b0; IR_ld = 1'b0;	D_rd = 1'b0; D_wr = 1'b0;
		alu_s1 = 1'b0;	alu_s0 = 1'b0;
		RF_s1 = 1'b0; RF_s0 = 1'b0;
		
		// Address and data buses default to retain their value, so latches are implied for each (required behavior)
		RF_W_addr = RF_W_addr; RF_Rp_addr = RF_Rp_addr; RF_Rq_addr = RF_Rq_addr;
		D_addr = D_addr; RF_W_data = RF_W_data;
		
		case(state)
			idle: begin
				//$display("Controller State: idle (time @%0dns)", $time);
				// Initialize the buses to zero
				RF_W_addr = 'b0; RF_Rp_addr = 'b0; RF_Rq_addr = 'b0;
				D_addr = 'b0; RF_W_data = 'b0;
				if(start)	next_state = init;
				else			next_state = idle;
			end
			
			init: begin
				//$display("Controller State: init (time @%0dns)", $time);
				PC_clr = 1;
				next_state = fetch;
			end
			
			fetch: begin
				//$display("Controller State: fetch (time @%0dns)", $time);
				I_rd = 1;
				next_state = fetch_wait;
			end
			
			fetch_wait: begin
				//$display("Controller State: fetch_wait (time @%0dns)", $time);
				IR_ld = 1;
				PC_inc = 1;
				next_state = decode;
			end
			
			decode: begin
				//$display("Controller State: decode (time @%0dns)", $time);
				case(inst[15:12])
					op_load: begin
						next_state = load;
					end
					
					op_store: begin
						next_state = store;
					end
					
					op_add: begin
						next_state = add;
					end
					
					op_ldc: begin
						next_state = ldc;
					end
					
					op_sub: begin
						next_state = sub;
					end
					
					op_jmpz: begin
						next_state = jmpz;
					end
					
					op_jmp: begin
						next_state = jmp;
					end
					
					op_jmpn: begin
						next_state = jmpn;
					end
					
					op_loadr: begin
						next_state = loadr;
					end
					
					op_storer: begin
						next_state = storer;
					end
										
					default: begin
						//$display("... decode branch: default (should NOT normally occur) (time @%0dns)", $time);
						next_state = idle;
					end
				endcase
			end
				
			load: begin
			//TO DO PART 1:  FILL IN THIS STATE
				//$display("Controller State: load (time @%0dns)", $time);
				D_rd = 1'b1;
				D_addr = inst[7:0];
				next_state = load_wait;
			end
			
			load_wait: begin
			//TO DO PART 1:  FILL IN THIS STATE
				//$display("Controller State: load_wait (time @%0dns)", $time);
				//
                RF_s1 = 1'b0;
                RF_s0 = 1'b1;
                RF_W_addr = inst[11:8];
                RF_W_wr = 1'b1;
				
				next_state = fetch;
			end
			
			store: begin
			//TO DO PART 1:  FILL IN THIS STATE
				//$display("Controller State: store (time @%0dns)", $time);
				RF_Rp_rd = 1'b1;
				RF_Rp_addr = inst[11:8];
				D_wr = 1'b1;
				D_addr = inst[7:0];
				next_state = fetch;
			end
			
			add: begin
				//$display("Controller State: add (time @%0dns)", $time);
				RF_Rp_addr = inst[7:4];
				RF_Rp_rd = 1;
				RF_s1 = 0;
				RF_s0 = 0;
				RF_Rq_addr = inst[3:0];
				RF_Rq_rd = 1;
				RF_W_addr = inst[11:8];
				RF_W_wr = 1;
				alu_s1 = 0;
				alu_s0 = 1;
				next_state = fetch;
			end
			
			ldc: begin
				//$display("Controller State: ldc (time @%0dns)", $time);
				RF_s1 = 1;
				RF_s0 = 0;
				RF_W_addr = inst[11:8];
				RF_W_wr = 1;
				RF_W_data = inst[7:0];
				next_state = fetch;
			end
			
			sub: begin
				//$display("Controller State: sub (time @%0dns)", $time);
				RF_Rp_addr = inst[7:4];
				RF_Rp_rd = 1;
				RF_s1 = 0;
				RF_s0 = 0;
				RF_Rq_addr = inst[3:0];
				RF_Rq_rd = 1;
				RF_W_addr = inst[11:8];
				RF_W_wr = 1;
				alu_s1 = 1;
				alu_s0 = 0;
				next_state = fetch;
			end
			
			jmpz: begin
				//$display("Controller State: jmpz (time @%0dns)", $time);
				RF_Rp_addr = inst[11:8];
				RF_Rp_rd = 1;
				if (RF_Rp_zero == 1)
					next_state = jmpzjmp;
				else
					next_state = fetch;
			end
			
			jmpzjmp: begin
				//$display("Controller State: jmpzjmp (time @%0dns)", $time);
				PC_ld = 1;
				next_state= fetch;
			end
			
		/******************** Remove this comment for Part 3 ********************
			jmp: begin
				//$display("Controller State: jmp (time @%0dns)", $time);
				PC_ld = 1;
				next_state= fetch;				
			end

			jmpn: begin
				//$display("Controller State: jmpn (time @%0dns)", $time);
				RF_Rp_addr = inst[11:8];
				RF_Rp_rd = 1;
				if (RF_Rp_neg == 1)
					next_state = jmpnjmp;
				else
					next_state = fetch;
			end

			jmpnjmp: begin
				//$display("Controller State: jmpnjmp (time @%0dns)", $time);
				PC_ld = 1;
				next_state= fetch;
			end

			loadr: begin
			//TO DO PART 3: FILL IN THIS STATE 
				//$display("Controller State: loadr (time @%0dns)", $time);
				// Note: Only difference to load is that data memory address comes from a different place
				next_state = loadr_wait;
			end

			loadr_wait: begin
			//TO DO PART 3: FILL IN THIS STATE
				//$display("Controller State: loadr_wait (time @%0dns)", $time);
				next_state = fetch;
			end
		
			storer: begin
			//TO DO PART 3:  FILL IN THIS STATE
				//$display("Controller State: storer (time @%0dns)", $time);
				// Note: Only difference to store is that data memory address comes from a different place
				next_state = fetch;
			end
		********************* Remove this comment for Part 3 ***********************/
			default: begin
				//$display("Controller State: default (should NOT normally occur) (time @%0dns)", $time);
				next_state = idle;
			end	
	
		endcase
	end
endmodule
