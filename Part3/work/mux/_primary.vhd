library verilog;
use verilog.vl_types.all;
entity mux is
    generic(
        n               : integer := 1
    );
    port(
        mux_out         : out    vl_logic_vector;
        din1            : in     vl_logic_vector;
        din2            : in     vl_logic_vector;
        \select\        : in     vl_logic
    );
end mux;
