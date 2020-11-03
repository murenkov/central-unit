/*
* Testbench for adder.v
*/

`timescale 1us/1ns

module adder_testbench();

    reg a, b;
    reg [3:0] S;
    reg M;
    reg Pin;
    wire D, F;
    wire R;
    wire Pout;

    localparam PERIOD = 1;

    adder UUT(
        .a          (a),
        .b          (b),
        .S          (S),
        .M          (M),
        .Pin        (Pin),
        .D          (D),
        .F          (F),
        .R          (R),
        .Pout       (Pout)
    );

    initial begin
        $dumpfile("./adder.vcd");
        $dumpvars(0, adder_testbench);

        a = 0;
        b = 0;
        S = 4'b0110;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b0110;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b0110;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b0110;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 0;
        b = 0;
        S = 4'b0110;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b0110;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b0110;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b0110;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 0;
        b = 0;
        S = 4'b1001;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b1001;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b1001;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b1001;
        M = 1;
        Pin = 0;
        #PERIOD;

        a = 0;
        b = 0;
        S = 4'b1001;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b1001;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b1001;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b1001;
        M = 1;
        Pin = 1;
        #PERIOD;

        a = 0;
        b = 0;
        S = 4'b0001;
        M = 0;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b0001;
        M = 0;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b0001;
        M = 0;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b0001;
        M = 0;
        #PERIOD;

        a = 0;
        b = 0;
        S = 4'b0100;
        M = 0;
        #PERIOD;

        a = 0;
        b = 1;
        S = 4'b0100;
        M = 0;
        #PERIOD;

        a = 1;
        b = 0;
        S = 4'b0100;
        M = 0;
        #PERIOD;

        a = 1;
        b = 1;
        S = 4'b0100;
        M = 0;
        #PERIOD;
    end

endmodule
