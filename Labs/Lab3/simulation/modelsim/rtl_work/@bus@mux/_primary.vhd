library verilog;
use verilog.vl_types.all;
entity BusMux is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic;
        o               : out    vl_logic_vector(7 downto 0)
    );
end BusMux;
