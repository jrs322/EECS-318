library verilog;
use verilog.vl_types.all;
entity co_DFF is
    port(
        q               : out    vl_logic;
        clk             : in     vl_logic;
        data            : in     vl_logic
    );
end co_DFF;
