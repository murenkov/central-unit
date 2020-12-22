/*
* Testbench for FrequencyDivider.v
*/

`timescale 1us/1ns

module FrequencyDivider_testbench();

    reg clock_in;
    reg reset;
    reg [31:0] divisor;
    wire clock_out;

    localparam CLOCK_PERIOD = 0.5;
    localparam PERIOD = 1;
    localparam LONG_PERIOD = 128;

    FrequencyDivider UUT(
        .clock_in   (clock_in),
        .reset      (reset),
        .divisor    (divisor),
        .clock_out  (clock_out)
    );

    always begin
        #CLOCK_PERIOD;
        clock_in <= ~clock_in;
    end

    initial begin
        $dumpfile("./FrequencyDivider.vcd");
        $dumpvars(0, FrequencyDivider_testbench);

        clock_in = 0;
        reset = 0;
        divisor = 32'd1;
        #PERIOD;

        reset = 1;
        #PERIOD;

        reset = 0;
        #PERIOD;

        divisor = 32'd2;
        #LONG_PERIOD;

        divisor = 32'd8;
        #LONG_PERIOD;

        divisor = 32'd32;
        #LONG_PERIOD;
        
        $finish;
    end

endmodule
