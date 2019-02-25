library verilog;
use verilog.vl_types.all;
entity four_bit_adder is
    port(
        sum             : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic
    );
end four_bit_adder;
