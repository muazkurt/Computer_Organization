library verilog;
use verilog.vl_types.all;
entity extend_XXVII is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        item            : in     vl_logic_vector(4 downto 0)
    );
end extend_XXVII;
