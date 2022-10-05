module _2x1_multiplexer(y, i, s);
	
	input [1:0] i; // input line
	input s; // select line
	output y;

	assign y = (~s&i[0]) | (s&i[1]);

endmodule 
