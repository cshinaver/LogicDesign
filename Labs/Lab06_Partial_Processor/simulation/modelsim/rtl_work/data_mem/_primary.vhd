library verilog;
use verilog.vl_types.all;
entity data_mem is
    generic(
        memfile         : string  := "data_memory_contents.txt"
    );
    port(
        clka            : in     vl_logic;
        addra           : in     vl_logic_vector(7 downto 0);
        dina            : in     vl_logic_vector(15 downto 0);
        douta           : out    vl_logic_vector(15 downto 0);
        wea             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of memfile : constant is 1;
end data_mem;
