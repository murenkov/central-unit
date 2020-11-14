/*
* Testbench for serial_ALU.v
*/

`timescale 1us/1ns

module ParallelALU_testbench();

    reg [3:0] A, B;
    reg [3:0] S;
    reg M;
    reg Pin;

    wire [3:0] R;
    wire [3:0] P;

    localparam PERIOD = 1;

    ParallelALU UUT(
        .A    (A),
        .B    (B),
        .S    (S),
        .M    (M),
        .Pin  (Pin),
        .R    (R),
        .P    (P)
    );

    initial begin
        $dumpfile("./ParallelALU.vcd");
        $dumpvars(0, ParallelALU_testbench);

        A = 0;
        B = 8;
        M = 0;
        S = 4'b0001;
        Pin = 0;
        #PERIOD;

        A = 1;
        B = 9;
        M = 0;
        S = 4'b0001;
        Pin = 0;
        #PERIOD;

        A = 2;
        B = 10;
        M = 0;
        S = 4'b0001;
        Pin = 0;
        #PERIOD;

        A = 3;
        B = 11;
        M = 0;
        S = 4'b0001;
        Pin = 0;
        #PERIOD;

        A = 4;
        B = 12;
        M = 0;
        S = 4'b0100;
        Pin = 0;
        #PERIOD;

        A = 5;
        B = 13;
        M = 0;
        S = 4'b0100;
        Pin = 0;
        #PERIOD;

        A = 6;
        B = 14;
        M = 0;
        S = 4'b0100;
        Pin = 0;
        #PERIOD;

        A = 7;
        B = 15;
        M = 0;
        S = 4'b0100;
        Pin = 0;
        #PERIOD;

        A = 8;
        B = 0;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 9;
        B = 1;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 10;
        B = 2;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 11;
        B = 3;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 12;
        B = 4;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 13;
        B = 5;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 14;
        B = 6;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 15;
        B = 7;
        M = 1;
        S = 4'b0110;
        Pin = 1;
        #PERIOD;

        A = 0;
        B = 8;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 1;
        B = 9;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 2;
        B = 10;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 3;
        B = 11;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 4;
        B = 12;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 5;
        B = 13;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 6;
        B = 14;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;

        A = 7;
        B = 15;
        M = 1;
        S = 4'b1001;
        Pin = 0;
        #PERIOD;
    end

endmodule

