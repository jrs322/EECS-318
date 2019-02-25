library verilog;
use verilog.vl_types.all;
entity shift_register is
    port(
        full_out        : out    vl_logic_vector(3 downto 0);
        s0              : out    vl_logic;
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        load_input      : in     vl_logic_vector(3 downto 0);
        LOAD            : in     vl_logic;
        shift           : in     vl_logic
    );
end shift_register;
