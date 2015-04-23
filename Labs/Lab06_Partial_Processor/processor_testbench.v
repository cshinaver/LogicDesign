// Testbench for simple processor
`timescale 1ns/1ns // Time unit/precision
module processor_testbench();

	// Contents of instruction and data memories
	parameter memfile_inst = "instruction_mem_InstTest.txt";
	parameter memfile_data = "data_memory_contents.txt";
	
	// Run Instruction Test (MAKE YOUR OWN MEMORY CONTENT FILES)
	//parameter memfile_inst = "instruction_mem_InstTest.txt";
	//parameter memfile_data = "data_mem_InstTest.txt";

	// Run Freq Calc (MAKE YOUR OWN MEMORY CONTENT FILES)
	//parameter memfile_inst = "instruction_mem_ThreshCntr.txt";
	//parameter memfile_data = "data_mem_ThreshCntr.txt";
	
	// DUT inputs
	reg clk, start, reset;
	
	// DUT outputs
	// ... no outputs from the processor system

	// Clock cycle counter, for debug use
	reg [15:0] cycleCount;
	
	// Instantiate DUT, with explicit signal map
	// ... give also the instruction and data memory files as parameters
	processor #(memfile_inst,memfile_data) CPU(.clk(clk), .start(start), .reset(reset));
				
	// Running clock, 50 MHz, cycle time 20ns
	parameter CYCLETIME = 20;
	parameter CYCLETIME_HALF = CYCLETIME/2;
	always
	begin
		clk = 1'b0; #(CYCLETIME_HALF);
		cycleCount = cycleCount + 1; // Update debug clock cycle counter
		clk = 1'b1; #(CYCLETIME_HALF);		
	end
	
	// Stimuli
	// ... inputs set on rising clock edge => DUT samples them on the next rising edge
	initial
	begin
		// As default, start with all input signals inactive/zero (except clk)
		start = 1'b0; reset = 1'b0;
		cycleCount = 0; // Reset the debug clock cycle counter

		// Reset in the very beginning, hold for 5 clock cycles and then release on falling clk edge
		$display("Initial reset (time @%0dns)", $time);
		reset = 1'b1; #(5*CYCLETIME);	@(posedge clk); reset = 1'b0;
		
		// Stay idle for 10 clock cycles
		cycleCount = 0; #(10*CYCLETIME);
		
		// Start
		$display("Start processor (time @%0dns)", $time);
		@(posedge clk); //cycleCount = 0;
		start = 1'b1; @(posedge clk); start = 1'b0;
		#(1*CYCLETIME);
		
		// Fetch first instruction "load" (0)
		$display("Fetch 1 (time @%0dns)", $time);
		@(posedge clk); cycleCount = 0; #(5*CYCLETIME);
		
		// Fetch instruction "load" (0)
		//$display("Fetch 1, instruction \"load\" (0) (time @%0dns)", $time);
		//@(posedge clk); cycleCount = 0; #(5*CYCLETIME);
		
		// Fetch instruction "load" (0)
		//$display("Fetch 2, instruction \"load\" (0) (time @%0dns)", $time);
		//@(posedge clk); cycleCount = 0; #(5*CYCLETIME);
		
		// Fetch instruction "load" (0)
		//$display("Fetch 3, instruction \"load\" (0) (time @%0dns)", $time);
		//@(posedge clk); cycleCount = 0; #(5*CYCLETIME);
		
		//cycleCount = 0; // Reset the debug clock cycle counter
		
	end
endmodule
