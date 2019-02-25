library verilog;
use verilog.vl_types.all;
entity circuit3 is
    port(
        product         : out    vl_logic_vector(9 downto 0);
        multiplicand    : in     vl_logic_vector(4 downto 0);
        multiplier      : in     vl_logic_vector(4 downto 0)
    );
end circuit3;
