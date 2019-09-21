library verilog;
use verilog.vl_types.all;
entity mipscomputer is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        writedata       : out    vl_logic_vector(31 downto 0);
        aluout          : out    vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        instr           : out    vl_logic_vector(31 downto 0);
        readdata        : out    vl_logic_vector(31 downto 0);
        memwrite        : out    vl_logic
    );
end mipscomputer;
