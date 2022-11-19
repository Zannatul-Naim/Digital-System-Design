module adder_subtractor(s, cout, a, b, mode);
	
	input [3:0]a, b;
	input mode;
	output [3:0] s;
	output cout;
	
	wire c1, c2, c3, c4;
	
	// For normalize the output
// 	full_adder f_a1(s[0], c1, a[0], (b[0]^mode), mode);
// 	full_adder f_a2(s[1], c2, a[1], (b[1]^mode), c1);
// 	full_adder f_a3(s[2], c3, a[2], (b[2]^mode), c2);
// 	full_adder f_a4(s[3], c4, a[3], (b[3]^mode), c3);
// 	and a1(cout, ~c4, mode);
	
	full_adder f_a1(s[0], c1, a[0], (b[0]^mode), mode);
	full_adder f_a2(s[1], c2, a[1], (b[1]^mode), c1);
	full_adder f_a3(s[2], c3, a[2], (b[2]^mode), c2);
	full_adder f_a4(s[3], cout, a[3], (b[3]^mode), c3);

endmodule


module full_adder(s, co, a, b, cin);

	input a, b, cin;
	output s, co;

	wire s1, c1, c2;

	half_adder h1(s1, c1, a, b);
	half_adder h2(s, c2, s1, cin);
	or(co, c2, c1);

endmodule

module half_adder(s, c, a, b);
	
	input a, b;
	output s, c;
	
	xor(s, a, b);
	and(c, a, b);

endmodule
