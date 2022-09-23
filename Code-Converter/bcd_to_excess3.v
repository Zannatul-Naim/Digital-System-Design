module bcd_to_excess3(e, b);
  
	output [3:0] e;
	input [3:0] b;
	
	assign e[3] = (b[2]&b[0]) | (b[2]&b[1]) | b[3];
	assign e[2] = (~b[2]&b[0]) | (~b[2]&b[1]) | (b[2]&~b[1]&~b[0]);
	assign e[1] = (~b[1]&~b[0]) | (b[1]&b[0]);
	assign e[0] = ~b[0];

endmodule
