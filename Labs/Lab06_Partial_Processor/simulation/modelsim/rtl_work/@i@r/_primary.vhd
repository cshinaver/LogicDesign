library verilog;
use verilog.vl_types.all;
entity IR is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        data_in         : in     vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(15 downto 0);
        ld              : in     vl_logic
    );
end IR;
