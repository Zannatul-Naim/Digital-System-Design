
module df(q, qbar, d, clk, clear);

	input d, clk, clear;
	output q, qbar;
	wire sbar, rbar;
	
	nand nand1(sbar, d, clk, clear);
	nand nand2(rbar, ~d, clk);
	
	nand nand3(q, sbar, qbar);
	nand nand4(qbar, rbar, q, clear);

endmodule
