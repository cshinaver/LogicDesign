library verilog;
use verilog.vl_types.all;
entity processor_testbench is
    generic(
        memfile_inst    : string  := "instruction_mem_InstTest.txt";
        memfile_data    : string  := "data_memory_contents.txt";
        CYCLETIME       : integer := 20;
        CYCLETIME_HALF  : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of memfile_inst : constant is 1;
    attribute mti_svvh_generic_type of memfile_data : constant is 1;
    attribute mti_svvh_generic_type of CYCLETIME : constant is 1;
    attribute mti_svvh_generic_type of CYCLETIME_HALF : constant is 3;
end processor_testbench;
