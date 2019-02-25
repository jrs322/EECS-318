library verilog;
use verilog.vl_types.all;
entity n_adder is
    generic(
        n               : integer := 1
    );
    port(
        sum             : out    vl_logic_vector;
        co              : out    vl_logic;
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        cin             : in     vl_logic
    );
end n_adder;
