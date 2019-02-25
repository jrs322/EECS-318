library verilog;
use verilog.vl_types.all;
entity circuit4 is
    generic(
        n               : integer := 1
    );
    port(
        total_sum       : out    vl_logic_vector;
        sb_carry        : out    vl_logic;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector;
        in2             : in     vl_logic_vector;
        in3             : in     vl_logic_vector;
        in4             : in     vl_logic_vector;
        in5             : in     vl_logic_vector;
        in6             : in     vl_logic_vector;
        in7             : in     vl_logic_vector;
        in8             : in     vl_logic_vector;
        in9             : in     vl_logic_vector
    );
end circuit4;
