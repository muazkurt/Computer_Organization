library verilog;
use verilog.vl_types.all;
entity muxIV is
    port(
        result          : out    vl_logic;
        iii             : in     vl_logic;
        ii              : in     vl_logic;
        i               : in     vl_logic;
        o               : in     vl_logic;
        \select\        : in     vl_logic_vector(1 downto 0)
    );
end muxIV;
