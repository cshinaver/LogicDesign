library verilog;
use verilog.vl_types.all;
entity Negator is
    port(
        a               : in     vl_logic_vector(6 downto 0);
        b               : out    vl_logic_vector(7 downto 0)
    );
end Negator;
