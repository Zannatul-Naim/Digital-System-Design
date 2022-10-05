module enable_2x1_multiplexer(y, i, s, e);
	
	input [1:0] i; // input line
	input s; // select line
	input e;  // enable line
	output y;

	assign y = e&(~s&i[0]) | (s&i[1]);

endmodule
