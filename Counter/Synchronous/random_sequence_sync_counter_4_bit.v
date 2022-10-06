
// Sequence : 0 -> 4 -> 7 -> 8 -> 10 -> 13 -> 9 -> 15 -> 0

module jkff(q, qbar, j, k, clear, clk);

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


module random_counter(q, clear, clk);
    
    input clear, clk;
    output [3:0] q;
    
    wire j3, k3, j2, k2, j1, k1, j0, k0;
    
    assign j3 = q[2]&q[1]&q[0];
    assign k3 = q[2]&~q[0] | (q[1]&q[0]);
    jkff jf3(q[3], , j3, k3, clear, clk);
    
    assign j2 = (~q[3]&~q[1]&~q[0]) | q[3]&(q[1]^q[0]);
    assign k2 = q[3] | (q[1]&~q[0]) | q[0];
    jkff jf2(q[2], , j2, k2, clear, clk);
    
    assign j1 = (q[3]&~q[2]) | (~q[3]&q[2]&~q[0]);
    assign k1 = 1;
    jkff jf1(q[1], , j1, k1, clear, clk);
    
    assign j0 = q[3]&q[1] | (~q[3]&q[2]&~q[1]);
    assign k0 = q[1] | ~q[3];
    jkff jf0(q[0], , j0, k0, clear, clk);
    
endmodule
