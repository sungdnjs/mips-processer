library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        clk             : in     vl_logic;
        w_enable        : in     vl_logic;
        r_addr1         : in     vl_logic_vector(4 downto 0);
        r_addr2         : in     vl_logic_vector(4 downto 0);
        w_addr1         : in     vl_logic_vector(4 downto 0);
        w_data1         : in     vl_logic_vector(31 downto 0);
        r_data1         : out    vl_logic_vector(31 downto 0);
        r_data2         : out    vl_logic_vector(31 downto 0)
    );
end regfile;
