module full_adder(s, cout, a, b, cin);

  input a, b, cin;
  output s, cout;
  wire hs1, hc1, hc2;

  halfadder ha1(hs1, hc1, a, b);
  halfadder ha2(s, hc2, hs1, cin);
  or o1(cout, hc1, hc2);

endmodule
