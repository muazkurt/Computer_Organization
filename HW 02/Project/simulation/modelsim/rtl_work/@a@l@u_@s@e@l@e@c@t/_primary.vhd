library verilog;
use verilog.vl_types.all;
entity ALU_SELECT is
    port(
        result          : out    vl_logic_vector(31 downto 0);
        \_nor\          : in     vl_logic_vector(31 downto 0);
        \_lsh\          : in     vl_logic_vector(31 downto 0);
        \_rsh\          : in     vl_logic_vector(31 downto 0);
        \_sub\          : in     vl_logic_vector(31 downto 0);
        \_xor\          : in     vl_logic_vector(31 downto 0);
        \_sum\          : in     vl_logic_vector(31 downto 0);
        \_or\           : in     vl_logic_vector(31 downto 0);
        \_and\          : in     vl_logic_vector(31 downto 0);
        alu_in          : in     vl_logic_vector(2 downto 0)
    );
end ALU_SELECT;
