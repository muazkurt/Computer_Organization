library verilog;
use verilog.vl_types.all;
entity adder is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        and_r           : out    vl_logic_vector(31 downto 0);
        or_r            : out    vl_logic_vector(31 downto 0);
        xor_r           : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic;
        left            : in     vl_logic_vector(31 downto 0);
        right           : in     vl_logic_vector(31 downto 0);
        sum_ornot       : in     vl_logic
    );
end adder;
