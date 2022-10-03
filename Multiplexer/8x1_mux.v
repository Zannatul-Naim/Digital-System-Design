module mux(y,s,in);
output  y;
input [7:0] in;
input [2:0] s;
reg y;
always @(s)
begin
if(s==3'd0) y=in[0];
else if(s==3'd1) y=in[1];
else if(s==3'd2) y=in[2];
else if(s==3'd3) y=in[3];
else if(s==3'd4) y=in[4];
else if(s==3'd5) y=in[5];
else if(s==3'd6) y=in[6];
else  y=in[7];
end
endmodule

// TestBench

module tb_mux();
reg [7:0]in;
reg [2:0]s;
wire y;
mux m1(y,s,in);
initial
begin
in=8'b10110110;
s[0]=1'b0;
s[1]=1'b0;
s[2]=1'b0;
end
always #40  s[2]=~s[2];
always #20  s[1]=~s[1];
always #10  s[0]=~s[0];
initial
begin
#200 $finish;
end
endmodule
