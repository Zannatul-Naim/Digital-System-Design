module ripple_carry_adder(a, b, cin, s, co);
    input [3:0] a;
    input [3:0] b;
    input cin;
    output [3:0] s;
    output co;
    wire w1, w2, w3;

    fulladder fa1(s[0], w1, a[0], b[0], cin);
    fulladder fa2(s[1], w2, a[1], b[1], w1);
    fulladder fa3(s[2], w3, a[2], b[2], w2);
    fulladder fa4(s[3], co, a[3], b[3], w3);

endmodule
