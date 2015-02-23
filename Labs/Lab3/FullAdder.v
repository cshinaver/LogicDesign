module FullAdder(a, b, cin, cout, s);
	input a, b, cin;
	output s, cout;
	wire w_axb, w_candaxb, w_aandb;
	
	xor xor1(w_axb, a, b);
	xor xor2(s, w_axb, cin);
	and and1(w_candaxb, w_axb, cin);
	and and2(w_aandb, a, b);
	or or1(cout, w_aandb, w_candaxb);
endmodule
