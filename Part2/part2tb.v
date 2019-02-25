module Testbench ();
  reg CLK;
  reg[3:0] A, B;
  wire[3:0] p_register, a_register;
  circuit2 multiplier(p_register, a_register, CLK, A, B);

  initial begin
    A = 4'b0000; B = 4'b0000;
    CLK = 1;
    #10 A = 4'b0010; B = 4'b0010;
    #60 A = 4'b0000; B = 4'b0000;
    #120 A = 4'b1111; B = 4'b0011; 
    #300 $finish;


  end

  always
    #5 CLK = ~CLK;



endmodule // testbench
