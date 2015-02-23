// Testbenches for Bin2BCD4, Bin2BCD8, Bin2BCD16
`timescale 1ns/1ns // Time unit/precision

module Bin2BCD4_testbench();
	reg [3:0] binWord;
	wire [3:0] BCD_tens, BCD_ones;
	reg [4:0] i;
	
	// Instantiate DUT, with explicit signal map
	Bin2BCD4 Converter(.inBin (binWord), .tens(BCD_tens), .ones(BCD_ones));
	
	// Apply input combinations one at a time
	initial
	begin
	
		binWord = 8'b00000000; #20; // Wait 20 time units before next line
		if(!(BCD_tens=='d0 && BCD_ones=='d0)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		binWord = 8'b00000001; #20; // Wait 20 time units before next line
		if(!(BCD_tens=='d0 && BCD_ones=='d1)) $error("BCD conversion of 8'b%b failed.", binWord);
	
		binWord = 'd2; #20; // Wait 20 time units before next line
		if(!(BCD_tens=='d0 && BCD_ones=='d2)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		for (i=0; i<16; i=i+1)
		begin
			binWord = i; #20; // Wait 20 time units before next line
			
			// Check conversion result
			//TODO
		end	
	end
endmodule

module Bin2BCD8_testbench();
	reg [7:0] binWord;
	wire [3:0] BCD_hundreds, BCD_tens, BCD_ones;
	reg [8:0] i;
	
	// Instantiate DUT, with explicit signal map
	Bin2BCD8 Converter(.inBin (binWord), .hundreds (BCD_hundreds), .tens(BCD_tens), .ones(BCD_ones));

	// Apply input combinations one at a time
	initial
	begin
	
		binWord = 8'b00000000; #20; // Wait 20 time units before next line
		if(!(BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d0)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		binWord = 8'b00000001; #20; // Wait 20 time units before next line
		if(!(BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d1)) $error("BCD conversion of 8'b%b failed.", binWord);
	
		binWord = 'd2; #20; // Wait 20 time units before next line
		if(!(BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d2)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		for (i=0; i<256; i=i+1)
		begin
			binWord = i; #20; // Wait 20 time units before next line
			
			// Check conversion result
			//TODO
		end
	end
endmodule

module Bin2BCD16_testbench();
	reg [15:0] binWord;
	wire [3:0] BCD_thousands10, BCD_thousands, BCD_hundreds, BCD_tens, BCD_ones;
	reg [16:0] i;
	
	// Instantiate DUT, with explicit signal map
	Bin2BCD16 Converter(.inBin (binWord), .thousands10 (BCD_thousands10), .thousands (BCD_thousands), .hundreds (BCD_hundreds), .tens(BCD_tens), .ones(BCD_ones));

	// Apply input combinations one at a time
	initial
	begin
	
		binWord = 8'b00000000; #20; // Wait 20 time units before next line
		if(!(BCD_thousands10=='d0 && BCD_thousands =='d0 && BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d0)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		binWord = 8'b00000001; #20; // Wait 20 time units before next line
		if(!(BCD_thousands10=='d0 && BCD_thousands =='d0 && BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d1)) $error("BCD conversion of 8'b%b failed.", binWord);
	
		binWord = 'd2; #20; // Wait 20 time units before next line
		if(!(BCD_thousands10=='d0 && BCD_thousands =='d0 && BCD_hundreds=='d0 && BCD_tens=='d0 && BCD_ones=='d2)) $error("BCD conversion of 8'b%b failed.", binWord);
		
		for (i=0; i<65536; i=i+100)
		begin
			binWord = i; #20; // Wait 20 time units before next line
			
			// Check conversion result
			//TODO
		end
		
		binWord = 'd65535; #20; // Wait 20 time units before next line
		binWord = 'd65536; #20; // Overflow
	end
endmodule