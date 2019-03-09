library verilog;
use verilog.vl_types.all;
entity muxII is
    port(
        result          : out    vl_logic;
        i               : in     vl_logic;
        o               : in     vl_logic;
        \select\        : in     vl_logic
    );
end muxII;
