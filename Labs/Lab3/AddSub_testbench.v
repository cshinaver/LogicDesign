`timescale 1ns/1ns

module AddSub_testbench();
	reg [6:0] A, B;  //7-bit inputs
	reg selSub;      //1-bt selection signal
	wire [7:0] S;	  //8-bit output
	
	AddSub AddSub_test(A, B, selSub, S);  //Instantiate AddSub module
	
	initial begin
		//Addition test cases
		A = 7'b0001111; B = 7'b1111111; selSub = 1'b0; #20;
		A = 7'b1110000; B = 7'b0101010; selSub = 1'b0; #20;
		A = 7'b1000000; B = 7'b1000000; selSub = 1'b0; #20;
		A = 7'b0111111; B = 7'b0111111; selSub = 1'b0; #20;
		//Subtraction test cases
		A = 7'b0100011; B = 7'b0110000; selSub = 1'b1; #20;
		A = 7'b1000001; B = 7'b0111111; selSub = 1'b1; #20;
		A = 7'b0111111; B = 7'b1000000; selSub = 1'b1; #20;
		A = 7'b1001110; B = 7'b1000100; selSub = 1'b1; #20;
	end
	
endmodule
