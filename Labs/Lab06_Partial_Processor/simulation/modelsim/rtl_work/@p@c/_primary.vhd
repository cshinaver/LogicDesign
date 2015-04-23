library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        ld              : in     vl_logic;
        inc             : in     vl_logic;
        pc_addr         : out    vl_logic_vector(15 downto 0);
        jmp_addr        : in     vl_logic_vector(15 downto 0)
    );
end PC;
