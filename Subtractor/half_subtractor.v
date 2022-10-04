module half_subtractor(difference, borrow, a, b);
	
	input a, b;
	output difference, borrow;

	xor(difference, a, b); // difference = a(xor)b
	and(borrow, ~a, b);  // borrow = (not)a(and)b

endmodule
	
