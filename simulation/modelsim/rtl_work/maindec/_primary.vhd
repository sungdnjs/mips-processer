library verilog;
use verilog.vl_types.all;
entity maindec is
    port(
        op              : in     vl_logic_vector(5 downto 0);
        memtoreg        : out    vl_logic;
        memwrite        : out    vl_logic;
        branch          : out    vl_logic;
        alusrc          : out    vl_logic;
        regdst          : out    vl_logic;
        regwrite        : out    vl_logic;
        jump            : out    vl_logic;
        zeroextend      : out    vl_logic;
        aluop           : out    vl_logic_vector(3 downto 0)
    );
end maindec;
