library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        memtoregE       : in     vl_logic;
        memtoregM       : in     vl_logic;
        memtoregW       : in     vl_logic;
        pcsrcD          : in     vl_logic;
        branchD         : in     vl_logic;
        alusrcE         : in     vl_logic;
        regdstE         : in     vl_logic;
        regwriteE       : in     vl_logic;
        regwriteM       : in     vl_logic;
        regwriteW       : in     vl_logic;
        jumpD           : in     vl_logic;
        zeroextendD     : in     vl_logic;
        alucontrolE     : in     vl_logic_vector(5 downto 0);
        equalD          : out    vl_logic;
        pcF             : out    vl_logic_vector(31 downto 0);
        instrF          : in     vl_logic_vector(31 downto 0);
        aluoutM         : out    vl_logic_vector(31 downto 0);
        writedataM      : out    vl_logic_vector(31 downto 0);
        readdataM       : in     vl_logic_vector(31 downto 0);
        opD             : out    vl_logic_vector(5 downto 0);
        functD          : out    vl_logic_vector(5 downto 0);
        flushE          : out    vl_logic
    );
end datapath;
