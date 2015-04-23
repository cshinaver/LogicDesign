library verilog;
use verilog.vl_types.all;
entity JMP_addr is
    port(
        PC_in           : in     vl_logic_vector(15 downto 0);
        IR_in           : in     vl_logic_vector(15 downto 0);
        jmp_out         : out    vl_logic_vector(15 downto 0)
    );
end JMP_addr;
