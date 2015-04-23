library verilog;
use verilog.vl_types.all;
entity mux16_3x1 is
    port(
        i0              : in     vl_logic_vector(15 downto 0);
        i1              : in     vl_logic_vector(15 downto 0);
        i2              : in     vl_logic_vector(7 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        d               : out    vl_logic_vector(15 downto 0)
    );
end mux16_3x1;
