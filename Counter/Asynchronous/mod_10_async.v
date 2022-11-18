
module mod_10_counter(q, clk, pre);
	input clk, pre;
	output [3:0] q;
	jk_flip_flop jk1(q[0],,1,1,!(q[1]&q[3]),clk,pre);
	jk_flip_flop jk2(q[1],,1,1,!(q[1]&q[3]),q[0],pre);
	jk_flip_flop jk3(q[2],,1,1,!(q[1]&q[3]),q[1],pre);
	jk_flip_flop jk4(q[3],,1,1,!(q[1]&q[3]),q[2],pre);
endmodule


module jk_flip_flop(q, qbar, j, k, clear, clk, pre);

    input j, k, clear, clk, pre;
    output q, qbar;
    
    wire n1_out, n2_out, n3_out, n4_out, n5_out, n6_out, cbar;
    
    nand nand1(n1_out, j, qbar, clk, clear, pre);
    nand nand2(n2_out, k, clk, q);
    
    nand nand3(n3_out, n1_out, n4_out, pre);
    nand nand4(n4_out, n2_out, n3_out, clear);
    
    not n1(cbar, clk);
    
    nand nand5(n5_out, n3_out, cbar);
    nand nand6(n6_out, n4_out, cbar);
    
    nand nand7(q, n5_out, qbar, pre);
    nand nand8(qbar, n6_out, q, clear);
    
endmodule
