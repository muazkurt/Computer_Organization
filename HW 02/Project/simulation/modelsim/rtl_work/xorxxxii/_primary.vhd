library verilog;
use verilog.vl_types.all;
entity xorxxxii is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        temp            : in     vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0)
    );
end xorxxxii;
