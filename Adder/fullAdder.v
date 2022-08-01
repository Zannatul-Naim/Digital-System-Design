module full_adder(s, cout, a, b, cin);
  
  input a, b, cin;
  output s, cout;
  assign s = a^b^c;
  assign cout = (a&b) | (b&c) | (c&a);
  
endmodule
