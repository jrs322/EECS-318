library verilog;
use verilog.vl_types.all;
entity DFF is
    port(
        shift_out       : out    vl_logic;
        Q               : out    vl_logic;
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        LD_VAL          : in     vl_logic;
        LOAD            : in     vl_logic;
        shift           : in     vl_logic
    );
end DFF;
