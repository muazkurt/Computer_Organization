library verilog;
use verilog.vl_types.all;
entity alu32 is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end alu32;
