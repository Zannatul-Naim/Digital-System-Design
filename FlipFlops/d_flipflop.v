module d_ff(q, qbar, d, clk, clear);
    input clear, clk, d;
    output q, qbar;
    wire cbar, r, rbar, s, sbar;

    not(cbar, clear);
    nand(sbar, s, rbar);
    nand(s, cbar, ~clk, sbar);
    nand(r, s, ~clk, rbar);
    nand(rbar, r, cbar, d);
    nand(q, s, qbar);
    nand(qbar, q, cbar, r);

endmodule
