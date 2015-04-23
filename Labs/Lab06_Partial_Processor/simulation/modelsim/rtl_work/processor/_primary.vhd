library verilog;
use verilog.vl_types.all;
entity processor is
    generic(
        memfile_inst    : string  := "instruction_memory_contents.txt";
        memfile_data    : string  := "data_memory_contents.txt"
    );
    port(
        clk             : in     vl_logic;
        start           : in     vl_logic;
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of memfile_inst : constant is 1;
    attribute mti_svvh_generic_type of memfile_data : constant is 1;
end processor;
