library verilog;
use verilog.vl_types.all;
entity forwarding_unit is
    port(
        rsD             : in     vl_logic_vector(4 downto 0);
        rtD             : in     vl_logic_vector(4 downto 0);
        rsE             : in     vl_logic_vector(4 downto 0);
        rtE             : in     vl_logic_vector(4 downto 0);
        writeregM       : in     vl_logic_vector(4 downto 0);
        writeregW       : in     vl_logic_vector(4 downto 0);
        regwriteM       : in     vl_logic;
        regwriteW       : in     vl_logic;
        forwardaD       : out    vl_logic;
        forwardbD       : out    vl_logic;
        forwardaE       : out    vl_logic_vector(1 downto 0);
        forwardbE       : out    vl_logic_vector(1 downto 0)
    );
end forwarding_unit;
