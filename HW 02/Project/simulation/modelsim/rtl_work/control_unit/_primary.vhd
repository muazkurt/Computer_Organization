library verilog;
use verilog.vl_types.all;
entity control_unit is
    port(
        select_bits_ALU : out    vl_logic_vector(2 downto 0);
        shift_select    : out    vl_logic;
        slt_select      : out    vl_logic;
        write_enable    : out    vl_logic;
        function_code   : in     vl_logic_vector(5 downto 0)
    );
end control_unit;
