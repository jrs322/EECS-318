library verilog;
use verilog.vl_types.all;
entity n_bitadder is
    generic(
        WIDTH           : integer := 4
    );
    port(
        Sum             : out    vl_logic_vector;
        Cout            : out    vl_logic;
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Cin             : in     vl_logic
    );
end n_bitadder;
