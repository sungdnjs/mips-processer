library verilog;
use verilog.vl_types.all;
entity signext is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        zero            : in     vl_logic;
        y               : out    vl_logic_vector(31 downto 0)
    );
end signext;
