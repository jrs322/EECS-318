library verilog;
use verilog.vl_types.all;
entity circuit2 is
    port(
        p_output        : out    vl_logic_vector(3 downto 0);
        a_output        : out    vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        multiplier      : in     vl_logic_vector(3 downto 0);
        multiplicand    : in     vl_logic_vector(3 downto 0)
    );
end circuit2;
