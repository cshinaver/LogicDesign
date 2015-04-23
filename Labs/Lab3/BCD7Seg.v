module BCD7Seg(inDigit, outSegments);
    input [3:0] inDigit; // One BCD digit in (unsigned binary)
    output [6:0] outSegments; // Control for 7 segments
    reg [6:0] outSegments;

    always @ (inDigit)
        case (inDigit)
            4'b0000: outSegments <= 7'b1000000; // 0
            4'b0001: outSegments <= 7'b1111001; // 1
            4'b0010: outSegments <= 7'b0100100; // 2
            4'b0011: outSegments <= 7'b0110000; // 3
            4'b0100: outSegments <= 7'b0011001; // 4
            4'b0101: outSegments <= 7'b0010010; // 5
            4'b0110: outSegments <= 7'b0000010; // 6
            4'b0111: outSegments <= 7'b1111000; // 7
            4'b1000: outSegments <= 7'b0000000; // 8
            4'b1001: outSegments <= 7'b0011000; // 9
            // In other words, to
            // display a 0, we want
            // segments 0,1,2,3,4,
            // and 5 to be lit up.
            // Segments are turned
            // on by a logic 0;
            // thus, only segment 6
            // (outSegments[6]) is
            // turned off
            // (indicated by
            // presence of logic 1)
            // FILL IN 1-9
            default: outSegments <= 7'b1111111; // 10-15 blank
        endcase
endmodule
