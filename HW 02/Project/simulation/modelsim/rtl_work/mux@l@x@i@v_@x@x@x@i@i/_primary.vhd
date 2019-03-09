library verilog;
use verilog.vl_types.all;
entity muxLXIV_XXXII is
    port(
        result          : out    vl_logic_vector(31 downto 0);
        i               : in     vl_logic_vector(31 downto 0);
        o               : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic
    );
end muxLXIV_XXXII;
