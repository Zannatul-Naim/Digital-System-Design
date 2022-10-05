module mux_2x1(y, i0, i1, s);
	
	input i0, i1; // input line
	input s; // select line
	output y;

	assign y = (~s&i0) | (s&i1);

endmodule


module mux_4x1_using_2x1(y, i, s);

	input [3:0] i;
	input [1:0] s;
	output y;
	wire x1, x2;
	
	mux_2x1 m1(x1, i[0], i[1], s[0]);
	mux_2x1 m2(x2, i[2], i[3], s[0]);
	mux_2x1 m3(y, x1, x2, s[1]);

endmodule
