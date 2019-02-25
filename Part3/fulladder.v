module fulladder (
  input A,
  input B,
  input Cin,
  output Sum,
  output Cout
);
assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule

module n_bitadder #( // N bit full adder
   parameter WIDTH = 4
) (
  output [WIDTH-1:0] Sum,
  output Cout,
  input [WIDTH-1:0] A,
  input [WIDTH-1:0] B,
  input Cin

);

wire [WIDTH:0] w;

assign w[0] = Cin;
assign Cout = w[WIDTH];

genvar i;
  generate
   for(i = 0; i < WIDTH; i = i + 1)
   begin : FULL_ADDER
   fulladder U (.A(A[i]), .B(B[i]), .Cin(w[i]), .Sum(Sum[i]), .Cout(w[i+1]));
   end
  endgenerate

endmodule
