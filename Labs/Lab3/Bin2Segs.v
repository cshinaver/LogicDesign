module Bin2Segs (num, hundreds, tens, ones, sign);
    input [6:0] num;
    output [7:0] hundreds, tens, ones;
    output sign;
    wire [6:0] inputNum;
    wire [7:0] absSignOut;
    wire [3:0] hunBCD, tenBCD, oneBCD;
    wire [7:0] hunBCDOut, tenBCDOut, oneBCDOut;
    wire ss;

    assign sign = ss;
    assign hundreds = hunBCDOut;
    assign tens = tenBCDOut;
    assign ones = oneBCDOut;


    AbsSign abs(inputNum, absSignOut, ss);
    Bin2BCD8 b2bcd8(absSignOut, hunBCD, tenBCD, oneBCD);
    BCD7Seg bcd7seg1(hunBCD, hunBCDOut);
    BCD7Seg bcd7seg2(tenBCD, tenBCDOut);
    BCD7Seg bcd7seg3(oneBCD, oneBCDOut);

endmodule
