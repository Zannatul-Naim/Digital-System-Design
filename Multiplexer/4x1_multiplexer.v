module _4x1_multiplexer(y, i, s, e);
	
	input [3:0] i;
	input [1:0] s;
	input e; // enable

	output y;

	assign y = e&((~s[1]&~s[0]&i[0]) + (~s[1]&s[0]&i[1]) + (s[1]&~s[0]&i[2]) + (s[1]&s[0]&i[3]));

endmodule
