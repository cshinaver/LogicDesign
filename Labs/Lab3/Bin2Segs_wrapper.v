module Bin2Segs_wrapper(SW, HEX0, HEX1, HEX2, HEX3, LEDR);
	input [17:0] SW;
	output [6:0] HEX0, HEX1, HEX2, HEX3; //7-seg displays
	output [17:0] LEDR; //Red LEDs
	wire [6:0] A;
	wire [6:0] huns, tens, ones; //hundreds, tens, and ones signals
	wire ss;                     //This is the sign signal that goes to HEX3...
									     //The sign signal lights up segment 6 of HEX3 if input is a negative number
	
	
	assign A[6:0] = SW[6:0];
	assign LEDR[6:0] = A[6:0];
	assign HEX0 = ones;
	assign HEX1 = tens;
	assign HEX2 = huns;
	
	/* 1.  TO DO: You need one line of Verilog code that lights up the negative sign (segment 6) of HEX3.
	          There are several ways to do this and, as a hint, think of how you can use concatenation {} and bitwise NOT ~
	*/
    assign HEX3 = ss;
	
	/* 2.  TO DO: Instantiate one Bin2Segs module below.  Make sure you pay attention to the wire names given to you (decalred above).
	*/
    Bin2Segs b2s(A, huns, tens, ones, ss);

endmodule
