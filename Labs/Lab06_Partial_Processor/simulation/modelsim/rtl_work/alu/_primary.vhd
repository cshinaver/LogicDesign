library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        D               : out    vl_logic_vector(15 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        Z               : out    vl_logic;
        N               : out    vl_logic
    );
end alu;
