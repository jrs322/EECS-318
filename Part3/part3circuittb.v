// Testbench for part 3

module Testbench(); // Testing input shifter
  reg[4:0] a, b;
  wire[9:0] out;
  circuit3 circuit(out, a, b);
  initial begin
    a = 5'b10011; 
    b = 5'b01011;
    #10 a = 5'b01011; b = 5'b11101;
    #30 a = 5'b10110; b = 5'b10101;
    #50 a = 5'b10110; b = 5'b00100;

  end

endmodule
