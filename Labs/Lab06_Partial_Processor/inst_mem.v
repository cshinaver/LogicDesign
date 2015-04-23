module inst_mem(clka, addra, douta);
  input clka;
  input [15:0] addra;
  output reg [15:0] douta;
  parameter memfile = "instruction_memory_contents.txt";
  
  // Memory array: 16-bit words, x 256
  reg [15:0] mem [0:255];

  // Initialize memory contents
  initial
  begin
   $readmemh(memfile, mem);
	//mem[0] = 16'h0000;
	//mem[1] = 16'h0000;
	//mem[2] = 16'h0000;
  end
  
  // NOTE: memory output is synchronous
  always @(posedge clka)
    begin
	   douta = mem[addra];
    end

endmodule

