library verilog;
use verilog.vl_types.all;
entity muxVIII is
    port(
        result          : out    vl_logic;
        vii             : in     vl_logic;
        vi              : in     vl_logic;
        v               : in     vl_logic;
        iv              : in     vl_logic;
        iii             : in     vl_logic;
        ii              : in     vl_logic;
        i               : in     vl_logic;
        o               : in     vl_logic;
        \select\        : in     vl_logic_vector(2 downto 0)
    );
end muxVIII;
