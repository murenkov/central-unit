/*
* Testbench for RALU.v
*/

`timescale 1us/1ns

module RALU_testbench();

    reg        clock;
    reg        reset;
    reg  [3:0] DataIn;
    reg  [3:0] S;
    reg        M;
    reg        Pin;
    reg        A;
    reg  [3:0] v;
    reg        wr;
    reg  [2:0] adr;
    reg        ISR;
    reg        ISL;
    wire       OSR;
    wire       OSL;
    wire       Pout;
    wire [3:0] R;

    localparam clock_period = 0.5;
    localparam PERIOD = 1;

    RALU UUT(
        .clock      (clock),
        .reset      (reset),
        .DataIn     (DataIn),
        .S          (S),
        .M          (M),
        .Pin        (Pin),
        .A          (A),
        .v          (v),
        .wr         (wr),
        .adr        (adr),
        .ISR        (ISR),
        .ISL        (ISL),
        .OSR        (OSR),
        .OSL        (OSL),
        .Pout       (Pout),
        .R          (R)
    );

    always begin
        #clock_period;
        clock = ~clock;
    end

    initial begin
        $dumpfile("./RALU.vcd");
        $dumpvars(0, RALU_testbench);

        clock = 0;

        // 1
        reset = 1;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 0;
        wr = 0;
        DataIn = 4;
        #PERIOD;

        // 2
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 0;
        wr = 0;
        DataIn = 4;
        #PERIOD;

        // 3
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 0;
        wr = 1;
        DataIn = 6;
        #PERIOD;

        // 4
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 1;
        wr = 1;
        DataIn = 3;
        #PERIOD;

        // 5
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 2;
        wr = 1;
        DataIn = 2;
        #PERIOD;

        // 6
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 1;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1000;
        adr = 3;
        wr = 1;
        DataIn = 2;
        #PERIOD;

        // 7
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1001;
        adr = 0;
        wr = 0;
        DataIn = 0;
        #PERIOD;

        // 8
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 0;
        v = 4'b1110;
        adr = 2;
        wr = 0;
        DataIn = 0;
        #PERIOD;

        // 9
        reset = 0;
        S = 4'b1001;
        M = 1;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 1;
        v = 4'b1000;
        adr = 0;
        wr = 1;
        DataIn = 0;
        #PERIOD;

        // 10
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 1;
        v = 4'b1001;
        adr = 1;
        wr = 0;
        DataIn = 0;
        #PERIOD;

        // 11
        reset = 0;
        S = 4'b0000;
        M = 0;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 1;
        v = 4'b1110;
        adr = 3;
        wr = 0;
        DataIn = 0;
        #PERIOD;

        // 12
        reset = 0;
        S = 4'b1001;
        M = 1;
        A = 0;
        ISR = 0;
        ISL = 0;
        Pin = 1;
        v = 4'b1000;
        adr = 1;
        wr = 1;
        DataIn = 0;
        #PERIOD;

        /*
        DataIn = 4;
        v[0] = 1;
        S = 4'b0000;
        #PERIOD;

        DataIn = 6;
        A = 1;
        v[0] = 1;
        wr = 1;
        adr = 0;
        #PERIOD;

        DataIn = 3;
        A = 1;
        v[0] = 1;
        wr = 1;
        adr = 1;
        #PERIOD;

        DataIn = 2;
        A = 1;
        v[0] = 1;
        wr = 1;
        adr = 2;
        #PERIOD;

        wr = 1;
        adr = 3;
        #PERIOD;

        A = 0;
        v[0] = 1;
        adr = 0;
        wr = 0;
        #PERIOD;

        A = 0;
        v[2:1] = 2'b11;
        adr = 2;
        wr = 0;
        #PERIOD;

        S = 4'b1001;
        M = 1;
        Pin = 1;
        adr = 0;
        wr = 1;
        #PERIOD;

        A = 0;
        v[0] = 1;
        adr = 1;
        wr = 0;
        #PERIOD;

        A = 0;
        v[2:1] = 2'b11;
        adr = 3;
        wr = 0;
        #PERIOD;

        S = 4'b1001;
        M = 1;
        Pin = 1;
        adr = 1;
        wr = 1;
        #PERIOD;
*/
        $finish;
    end

endmodule
