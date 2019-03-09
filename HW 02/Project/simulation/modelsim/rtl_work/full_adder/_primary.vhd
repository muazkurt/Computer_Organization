library verilog;
use verilog.vl_types.all;
entity full_adder is
    port(
        sum             : out    vl_logic;
        L_a_R           : out    vl_logic;
        L_o_R           : out    vl_logic;
        L_XOR_R         : out    vl_logic;
        cout            : out    vl_logic;
        left            : in     vl_logic;
        right           : in     vl_logic;
        cin             : in     vl_logic
    );
end full_adder;
