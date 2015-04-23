library verilog;
use verilog.vl_types.all;
entity control is
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        reset           : in     vl_logic;
        RF_W_addr       : out    vl_logic_vector(3 downto 0);
        RF_W_wr         : out    vl_logic;
        RF_Rp_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rp_rd        : out    vl_logic;
        RF_Rq_addr      : out    vl_logic_vector(3 downto 0);
        RF_Rq_rd        : out    vl_logic;
        RF_s1           : out    vl_logic;
        RF_s0           : out    vl_logic;
        alu_s1          : out    vl_logic;
        alu_s0          : out    vl_logic;
        RF_W_data       : out    vl_logic_vector(7 downto 0);
        inst            : in     vl_logic_vector(15 downto 0);
        I_rd            : out    vl_logic;
        RF_Rp_zero      : in     vl_logic;
        RF_Rp_neg       : in     vl_logic;
        D_rd            : out    vl_logic;
        D_wr            : out    vl_logic;
        D_addr          : out    vl_logic_vector(7 downto 0);
        pc_addr         : out    vl_logic_vector(15 downto 0)
    );
end control;
