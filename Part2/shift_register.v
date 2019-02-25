

module shift_reg_p (CLK, SI, D, SO, FO);
  parameter k = 3;
  input[k-1:0] D;
  input  CLK, SI;
  output SO;
  output [k-1:0] FO;
  reg[k-1:0] tmp = 0;
  always @ (negedge CLK)
    tmp = D;
  always @ ( posedge CLK )
    tmp = {SI, tmp[k-1:1]};

  assign SO = tmp[0];
  assign FO = tmp;
endmodule //a_register

module shift_reg_a (CLK, SI, D, SO, FO);
  parameter k = 3;
  input[k-1:0] D;
  input  CLK, SI;
  output SO;
  output [k-1:0] FO;
  reg[k-1:0] tmp = 0;
  always @ (D)
    tmp = D;
  always @ ( posedge CLK )
    tmp = {SI, tmp[k-1:1]};

  assign SO = tmp[0];
  assign FO = tmp;
endmodule //a_register
