library verilog;
use verilog.vl_types.all;
entity eqcmp is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        eq              : out    vl_logic
    );
end eqcmp;
