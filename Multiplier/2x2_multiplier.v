module half_adder(s, c, a, b);
	
	input a, b;
	output s, c;
	assign s = a^b;
	assign c = a&b;

endmodule

module multiplier(res, a, b);
	
	input [1:0] a, b;
	output [3:0] res;
	wire c1, c2;
	
	assign res[0] = a[0]&b[0];
	half_adder ha1(res[1], c1, (a[0]&b[1]), (a[1]&b[0]));
	half_adder ha2(res[2], c2, (a[1]&b[1]), c1);
	assign res[3] = c2;

endmodule
