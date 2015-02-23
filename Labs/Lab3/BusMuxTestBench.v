`timescale 1ns/1ns
module BusMuxTestBench();
	reg [7:0] a, b;
	reg sel;
	wire [7:0] o;
	
	BusMux bm(a, b, sel, o);
	
	initial begin
		a = 8'b00000001; b = 8'b0000011; sel = 1'b0; #20;
		a = 8'd5; b = 8'd10; sel = 1'b1; #20;
	end 
	
endmodule