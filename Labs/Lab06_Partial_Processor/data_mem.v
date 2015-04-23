module data_mem(clka, addra, dina, douta, wea);
  input clka;
  input wea;
  input [7:0] addra;
  input [15:0] dina;
  output [15:0] douta;
  parameter memfile = "data_memory_contents.txt";
  
  // Memory array: 16-bit words, x 256
  reg [15:0] mem [0:255];

  initial
  begin
	  $readmemh(memfile, mem);
	  //mem[0] = 16'h0000;
	  //mem[1] = 16'h0000;
	  //mem[2] = 16'h0000;
  end

  always @(posedge clka)
    if (wea)
      mem[addra] <= dina;

  // NOTE: memory output is asynchronous
  assign douta = mem[addra];

endmodule
      
