module half_subtractor(difference, borrow, a, b);
	
	input a, b;
	output difference, borrow;

	xor(difference, a, b); // difference = a(xor)b
	and(borrow, ~a, b);  // borrow = (not)a(and)b

endmodule
	

module full_subtractor(diff, borr, a, b, bin);
	
	input a, b, bin;
	output diff, borr;
	wire d1, b1, b2;	

	half_subtractor h1(d1, b1, a, b);
	half_subtractor h2(diff, b2, d1, bin);
	or o1(borr, b1, b2);

endmodule 
