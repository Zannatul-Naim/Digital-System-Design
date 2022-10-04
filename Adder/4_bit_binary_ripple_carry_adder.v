module half_adder(S, C, A, B);
	
	input A, B;
	output S, C;
	xor(S, A, B);
	and(C, A, B);

endmodule

module full_adder(S, Cout, A, B, Cin);
	
	input A, B, Cin;
	output S, Cout;
	wire s1, c1, c2;
	half_adder ha1(s1, c1, A, B);
	half_adder ha2(S, c2, s1, Cin);
	or o1(Cout, c1, c2); 

endmodule

module four_bit_binary_parallel_adder (S, Cout, A, B, Cin);

	input [3:0] A, B;
	input Cin;
	output [3:0] S;
	output Cout;
	wire [2:0] c;
	full_adder f1(S[0], c[0], A[0], B[0], Cin);
	full_adder f2(S[1], c[1], A[1], B[1], c[0]);
	full_adder f3(S[2], c[2], A[2], B[2], c[1]);
	full_adder f4(S[3], Cout, A[3], B[3], c[2]);

endmodule
