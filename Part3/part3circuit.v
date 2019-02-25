//This circuit implements circuit 2 but using a mux to determine the
// input being in two's complement or not and changing the input based on that
// Also loads extended register with bit based on msb of a input for a * b



module circuit3 (product,multiplicand, multiplier);
  input[4:0] multiplier, multiplicand; 
  output[9:0] product; 
  wire select_val, msb, co1, co2, co3, co4, carry_out; 
  wire[4:0] flipped, choice, choice2, mux1, mux2, mux3, mux4, mux5; 
  wire[8:0] adder_in1, adder_in2, adder_in3, adder_in4, adder_in5, sum1, sum2, sum3, sum4; 
   
  assign select_val = multiplier[4]; 
  assign choice2 = multiplicand;
  input_shifter #(5) shft(flipped, multiplier);
  mux #(5) chooser(choice, multiplier, flipped, select_val);
  //line 1 
  mux #(5) chooser1(mux1, 5'b00000, choice2,  choice[0]);
  assign adder_in1[8] = choice[0];
  assign adder_in1[7] = choice[0];
  assign adder_in1[6] = choice[0];
  assign adder_in1[5] = choice[0];
  assign adder_in1[4] = mux1[4];
  assign adder_in1[3] = mux1[3];
  assign adder_in1[2] = mux1[2];
  assign adder_in1[1] = mux1[1];
  assign adder_in1[0] = mux1[0];
  //line 2
  mux #(5) chooser2(mux2, 5'b00000, choice2,  choice[1]);
  assign adder_in2[8] = choice[1];
  assign adder_in2[7] = choice[1];
  assign adder_in2[6] = choice[1];
  assign adder_in2[5] = mux2[4];
  assign adder_in2[4] = mux2[3];
  assign adder_in2[3] = mux2[2];
  assign adder_in2[2] = mux2[1];
  assign adder_in2[1] = mux2[0];
  assign adder_in2[0] = 1'b0;
//line 3 
  mux #(5) chooser3(mux3, 5'b00000, choice2,  choice[2]);
  assign adder_in3[8] = choice[2]; 
  assign adder_in3[7] = choice[2];
  assign adder_in3[6] = mux3[4];
  assign adder_in3[5] = mux3[3];
  assign adder_in3[4] = mux3[2];
  assign adder_in3[3] = mux3[1];
  assign adder_in3[2] = mux3[0];
  assign adder_in3[1] = 1'b0;
  assign adder_in3[0] = 1'b0;
// line 4
  mux #(5) chooser4(mux4,5'b00000, choice2,  choice[3]);
  assign adder_in4[8] = choice[3];
  assign adder_in4[7] = mux4[4];
  assign adder_in4[6] = mux4[3];
  assign adder_in4[5] = mux4[2];
  assign adder_in4[4] = mux4[1];
  assign adder_in4[3] = mux4[0];
  assign adder_in4[2] = 1'b0;
  assign adder_in4[1] = 1'b0;
  assign adder_in4[0] = 1'b0;
//line 5
  mux #(5) chooser5(mux5,5'b00000, choice2, choice[4]);	
  assign adder_in5[8] = mux5[4];
  assign adder_in5[7] = mux5[3];
  assign adder_in5[6] = mux5[2];
  assign adder_in5[5] = mux5[1];
  assign adder_in5[4] = mux5[0];
  assign adder_in5[3] = 1'b0;
  assign adder_in5[2] = 1'b0;
  assign adder_in5[1] = 1'b0;
  assign adder_in5[0] = 1'b0;

// adders
  n_bitadder #(9) adder(sum1, co1, adder_in1, adder_in2, 1'b0);
  n_bitadder #(9) adder1(sum2, co2, adder_in3, adder_in4, 1'b0);
  n_bitadder #(9) adder2(sum3, co3, sum1, sum2, 1'b0);	
  n_bitadder #(9) adder3(sum4, co4, sum3, adder_in5, 1'b0);
  assign carry_out = (co1 | co2) | (co3 | co4); 
  assign product = {carry_out, sum4}; 
  initial begin 
    $monitor("%b %b %b %b %b %b %b %b %b %b %b %b %b", product, multiplier, multiplicand, adder_in1, adder_in2, adder_in3, adder_in4, adder_in5, mux1, mux2, mux3, mux4, mux5);
  end
endmodule
module input_shifter(choice, in); // It should only switch with the msb being 1
  parameter n = 2;

  input[n-1:0] in;
  output[n-1:0] choice;
  wire[n-1:0] choice, flip, twoc, zero;
  assign zero = 0; 
  assign flip = ~in;
  n_bitadder#(n) adder(choice, co, flip, zero, 1'b1);


endmodule


module mux(mux_out,din1,din2, select);
  parameter n = 1;

    input select;
    input[n-1:0] din1, din2;
    output[n-1:0] mux_out;
    wire[n-1:0] mux_out;
    assign mux_out = (select) ? din2 : din1;

endmodule
