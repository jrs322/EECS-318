

module circuit4 (total_sum, sb_carry, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9 );
  parameter n = 1;
  input[n-1:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9;
  output[n+7:0] total_sum;
  output sb_carry;
  reg[n-1+8:0] zero;
  wire[n+7:0] sum1, carry1, sum2, carry2, sum3, carry3, sum4, carry4, sum5, carry5, sum6, carry6,  sum7, carry7, sum8, carry8;
  nbitCSA #(n, n) adder1(sum1[n:0], carry1[n:0], in0, in1, in2);
  nbitCSA #(n+1, n) adder2(sum2[n+1:0], carry2[n+1:0], sum1[n:0], carry1[n:0], in3);
  nbitCSA #(n+2, n) adder3(sum3[n+2:0], carry3[n+2:0], sum2[n+1:0], carry2[n+1:0], in4);
  nbitCSA #(n+3, n) adder4(sum4[n+3:0], carry4[n+3:0], sum3[n+2:0], carry3[n+2:0], in5);
  nbitCSA #(n+4, n) adder5(sum5[n+4:0], carry5[n+4:0], sum4[n+3:0], carry4[n+3:0], in6);
  nbitCSA #(n+5, n) adder6(sum6[n+5:0], carry6[n+5:0], sum5[n+4:0], carry5[n+4:0], in7);
  nbitCSA #(n+6, n) adder7(sum7[n+6:0], carry7[n+6:0], sum6[n+5:0], carry6[n+5:0], in8);
  nbitCSA #(n+7, n) adder8(sum8[n+7:0], carry8[n+7:0], sum7[n+6:0], carry7[n+6:0], in9);
  n_bitadder #(n+8)total_adder(total_sum, sb_carry, sum8, carry8, 1'b0);
  initial begin 
    $monitor("%d %b %d %b %b", $time,{sb_carry, total_sum}, {sb_carry, total_sum}, sum3, carry3);
  end
endmodule //circuit4

module nbitCSA(sum, co, a, b, cin);
  parameter n = 1;
  parameter true_n = 1;

  output[n:0] sum;
  output[n:0] co;
  input[n-1:0] a, b;
  input[true_n-1:0] cin;
  wire [n-1:0] new_cin; 
  assign new_cin[n-1:0] = cin; 
  assign co[0] = 1'b0;
  assign sum[n] = 1'b0;
  generate 
    genvar i; 
  	for (i = 0; i < n; i = i + 1) begin
    	  fulladder adder(.Sum(sum[i]), .Cout(co[i+1]), .A(a[i]), .B(b[i]), .Cin(new_cin[i]));
        end
  endgenerate
initial begin 
 $monitor("%b %b", co, sum, a, b, cin, new_cin);
end

endmodule
