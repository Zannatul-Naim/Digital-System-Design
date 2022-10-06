module ms_jk_ff(q, qbar, j, k, clear, clk);

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
