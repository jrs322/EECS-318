library verilog;
use verilog.vl_types.all;
entity a_register is
    generic(
        k               : integer := 3
    );
    port(
        CLK             : in     vl_logic;
        SI              : in     vl_logic;
        D               : in     vl_logic_vector;
        SO              : out    vl_logic;
        FO              : out    vl_logic_vector
    );
end a_register;
