
module comparator(greater, equal, less, a1, a0, b1, b0);
	
	input a1, a0, b1, b0;
	output greater, equal, less;
	

	assign greater = (a0&~b0&b1) | (a1&~b1) | (a1&a0&~b0);
	assign equal = ~(a0^b0)&~(a1^b1);
	assign less = (~a1&~a0&b0) | (~a0&b0&b1) | (~a1&b1);

endmodule
