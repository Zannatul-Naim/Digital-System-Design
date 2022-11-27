
// Sequence : 0000 -> 1101 -> 1011 -> 1001 -> 0110 -> 1100 -> 0011 -> 1111 -> 0000

module random_seq(q, clr, clk);
    
    input clr, clk;
    output [3:0] q;
    
    wire j0, k0, j1, k1, j2, k2, j3, k3;
    
    assign j0 = ~q[1] & ~(q[3]^q[2]);
    assign k0 = (~q[3]&q[2]) | (~q[2]&~q[1]) | (q[1]&q[2]);
    jk_ff jk0(q[0], , j0, k0, clr, clk);
    
    assign j1 = (q[3]&q[2]) | (q[3]&q[0]);
    assign k1 = ~q[0] | q[2] | q[3];
    jk_ff jk1(q[1], , j1, k1, clr, clk);
    
    assign j2 = ~q[3] & ~(q[1]^q[0]) | (q[3]&~q[1]&q[0]);
    assign k2 = q[3] | ~q[1] | q[0];
    jk_ff jk2(q[2], , j2, k2, clr, clk);
    
    assign j3 = ~q[2] & ~(q[1]^q[0]) | (q[2]&q[1]&~q[0]);
    assign k3 = ~q[0] | ~(q[1]^q[2]) | (~q[1]&~q[0]);
    jk_ff jk3(q[3], , j3, k3, clr, clk);
    
endmodule

module jk_ff(q, qbar, j, k, clr, clk);
    
    input j, k, clr, clk;
    output q, qbar;
    
    wire a, b, y, ybar, c, d;
    
    nand nand1(a, j, qbar, clr, clk);
    nand nand2(b, k, q, clk);
    
    nand nand3(y, a, ybar);
    nand nand4(ybar, b, y, clr);
    
    wire cbar;
    not n1(cbar, clk);
    
    nand nand5(c, y, cbar);
    nand nand6(d, ybar, cbar);
    
    nand nand7(q, c, qbar);
    nand nand8(qbar, d, q);
    
endmodule
    
