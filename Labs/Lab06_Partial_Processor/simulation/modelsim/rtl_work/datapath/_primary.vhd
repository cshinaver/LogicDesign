library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RF_W_addr       : in     vl_logic_vector(3 downto 0);
        RF_W_wr         : in     vl_logic;
        RF_Rp_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rp_rd        : in     vl_logic;
        RF_Rq_addr      : in     vl_logic_vector(3 downto 0);
        RF_Rq_rd        : in     vl_logic;
        RF_s1           : in     vl_logic;
        RF_s0           : in     vl_logic;
        alu_s1          : in     vl_logic;
        alu_s0          : in     vl_logic;
        RF_W_data       : in     vl_logic_vector(7 downto 0);
        R_data          : in     vl_logic_vector(15 downto 0);
        RF_Rp_zero      : out    vl_logic;
        RF_Rp_neg       : out    vl_logic;
        rp              : out    vl_logic_vector(15 downto 0)
    );
end datapath;
