library verilog;
use verilog.vl_types.all;
entity hazard_detection_unit is
    port(
        rsD             : in     vl_logic_vector(4 downto 0);
        rtD             : in     vl_logic_vector(4 downto 0);
        rtE             : in     vl_logic_vector(4 downto 0);
        writeregE       : in     vl_logic_vector(4 downto 0);
        writeregM       : in     vl_logic_vector(4 downto 0);
        regwriteE       : in     vl_logic;
        memtoregE       : in     vl_logic;
        memtoregM       : in     vl_logic;
        branchD         : in     vl_logic;
        stallF          : out    vl_logic;
        stallD          : out    vl_logic;
        flushE          : out    vl_logic
    );
end hazard_detection_unit;
