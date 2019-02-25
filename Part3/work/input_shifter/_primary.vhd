library verilog;
use verilog.vl_types.all;
entity input_shifter is
    generic(
        n               : integer := 2
    );
    port(
        choice          : out    vl_logic_vector;
        \in\            : in     vl_logic_vector
    );
end input_shifter;
