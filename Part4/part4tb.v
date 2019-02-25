module Testbench ();
  reg[7:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9;
  wire[15:0] total_sum;
  wire sb_carry;
  circuit4 #(8) adder(total_sum, sb_carry,in0, in1, in2, in3, in4, in5, in6, in7, in8, in9); 
  initial begin

    in0 = 8'b00000001;
    in1 = 8'b00000010;
    in2 = 8'b00000011;
    in3 = 8'b00000100;
    in4 = 8'b00000101;
    in5 = 8'b00000110;
    in6 = 8'b00000111;
    in7 = 8'b00001000;
    in8 = 8'b00001001;
    in9 = 8'b00001010;
    #20 in0 = 0; 
    #20 in1 = 0;
    #20 in2 = 0;
    #20 in3 = 0;
    #20 in4 = 0;
    #20 in5 = 0;
    #20 in6 = 0;
    #20 in7 = 0;
    #20 in8 = 0;
    #20 in9 = 0;
    #50 in0 = 8'b11;
    #50 in1 = 8'b100;
    #50 in2 = 8'b101;
    #50 in3 = 8'b110;
    #50 in4 = 8'b111;
    #50 in5 = 8'b1000;
    #50 in6 = 8'b1001;
    #50 in7 = 8'b1010;

    #200 $finish;
  end
endmodule // Testbench
