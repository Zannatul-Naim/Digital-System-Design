module jk_ff(q, qbar, j, k, clear, clk);
  
  input j, k, clear, clk;
  output q, qbar;
  wire a, b, d, y, ybar, cbar, e;
  nand(a, qbar, j, clk, clear);
  nand(b, clk, k, q);
  nand(y, a, ybar);
  nand(ybar, y, clear, b);
  not(cbar, clk);
  nand(e, y, cbar);
  nand(d, cbar, ybar);
  nand(q, e, qbar);
  nand(qbar, q, clear, d);

endmodule
