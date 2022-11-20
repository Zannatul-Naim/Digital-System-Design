

module sync_up_down(q, ud, clk, clear);
	
	input ud, clk, clear;
	output [0:2] q;
	
	wire j1, j2, j3, k1, k2, k3;

	assign j1 = (~ud&~q[1]&~q[2]) | (ud&q[1]&q[2]);
	assign k1 = (~ud&~q[1]&~q[2]) | (ud&q[1]&q[2]);
	jk_ff jk_1(q[0], , j1, k1, clear, clk);

	assign j2 = ~(ud^q[2]);
	assign k2 = !(ud^q[2]);
	jk_ff jk_2(q[1], , j2, k2, clear, clk);
	
	assign j3 = 1;
	assign k3 = 1;
	jk_ff jk_3(q[2], , j3, k3, clear, clk);

endmodule

module jk_ff(q, qbar, j, k, clear, clk);

    input j, k, clear, clk;
    output q, qbar;
    
    wire n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, cbar;
    
    nand nand1(n1_out, j, qbar, clk, clear);
    nand nand2(n2_out, k, clk, q);
    
    nand nand3(n3_out, n1_out, n4_out);
    nand nand4(n4_out, n2_out, n3_out, clear);
    
    not n1(cbar, clk);
    
    nand nand5(n5_out, n3_out, cbar);
    nand nand6(n6_out, n4_out, cbar);
    
    nand nand7(q, n5_out, qbar);
    nand nand8(qbar, n6_out, q, clear);
    
endmodule
