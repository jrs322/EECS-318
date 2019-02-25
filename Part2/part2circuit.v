// Josh Schlichting
// EECS 318

module circuit2 (p_output, a_output, CLK, multiplier, multiplicand);
  input[3:0] multiplier, multiplicand;
  input CLK;
  output[3:0] p_output, a_output;
  wire[3:0] p_in_wire, adder_in_wire, p_output,adder_output;
  wire p_to_a_wire, DFF_in_wire, a_wire, LOAD,  DFF_out_wire;

  shift_reg_a #(4)a_module(CLK, p_to_a_wire, multiplier, a_wire, a_output); //CLK, SI, D, SO, FO
  shift_reg_p #(4)p_module(CLK, DFF_out_wire, adder_output, p_to_a_wire, p_output); //CLK, ALOAD, SI, D, SO, FO
  and first(adder_in_wire[0], a_wire, multiplicand[0]);
  and second(adder_in_wire[1], a_wire, multiplicand[1]);
  and third(adder_in_wire[2], a_wire, multiplicand[2]);
  and fourth(adder_in_wire[3], a_wire, multiplicand[3]);
  co_DFF dff_a(DFF_out_wire, CLK, DFF_in_wire);
  n_bitadder #(4) adder(adder_output, DFF_in_wire, adder_in_wire, p_output, 1'b0);
  initial begin
    $monitor("%d %d %d %b %b %b %b %b %b %b %d", $time, multiplier, multiplicand, a_wire, adder_in_wire, adder_output, DFF_in_wire, DFF_out_wire, p_output, a_output, {p_output,a_output});
  end
endmodule //circuit2

module co_DFF (q, clk, data);
  input data, clk;
  output q;
  reg q;
  initial
    q = 0;
  always @ ( posedge clk) begin
    q <= data;
  end
 endmodule
