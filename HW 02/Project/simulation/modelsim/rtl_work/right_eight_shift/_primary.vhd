library verilog;
use verilog.vl_types.all;
entity right_eight_shift is
    port(
        result          : out    vl_logic_vector(31 downto 0);
        regi            : in     vl_logic_vector(31 downto 0);
        regii           : in     vl_logic;
        aritmetic_logic : in     vl_logic
    );
end right_eight_shift;
