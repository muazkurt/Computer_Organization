library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        read1           : out    vl_logic_vector(31 downto 0);
        read2           : out    vl_logic_vector(31 downto 0);
        addr1           : in     vl_logic_vector(4 downto 0);
        addr2           : in     vl_logic_vector(4 downto 0);
        addr3           : in     vl_logic_vector(4 downto 0);
        writedata       : in     vl_logic_vector(31 downto 0);
        write_enable    : in     vl_logic;
        clock           : in     vl_logic
    );
end \register\;
