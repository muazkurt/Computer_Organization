library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        regi            : in     vl_logic_vector(31 downto 0);
        regii           : in     vl_logic_vector(31 downto 0);
        \select\        : in     vl_logic_vector(2 downto 0)
    );
end ALU;
