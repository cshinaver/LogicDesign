module BusMux(a, b, sel, o);
	input [7:0] a, b;
	input sel;
	output reg [7:0] o;
	
	
	always @(a or b or sel) begin
		case(sel)
			1'b0 : o <= a;
			1'b1 :o <= b;
			default: o <= a;
		endcase
	end
	
endmodule	