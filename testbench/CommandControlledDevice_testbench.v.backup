/*
* Testbench for CommandControlledDevice.v
*/

`timescale 1us/1ns

module CommandControlledDevice_testbench();

    reg clock, reset;

    reg [3:0] data_in;

    wire [3:0] data_out;
    wire [2:0] port_id;
    wire port_read, port_write;

    localparam clock_period = 0.5;
    localparam PERIOD = 1;

    CommandControlledDevice UUT(
        .clock      (clock),
        .reset      (reset),
        .data_in    (data_in),
        .data_out   (data_out),
        .port_id    (port_id),
        .port_read  (port_read),
        .port_write (port_write)
    );

    always begin
        #clock_period;
        clock = ~clock;
    end

    initial begin
        $dumpfile("./CommandControlledDevice.vcd");
        $dumpvars(0, CommandControlledDevice_testbench);

        clock = 0;

        reset = 1;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 3;
        #PERIOD;

        reset = 0;
        data_in = 3;
        #PERIOD;

        reset = 0;
        data_in = 5;
        #PERIOD;

        reset = 0;
        data_in = 5;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        reset = 0;
        data_in = 0;
        #PERIOD;

        $finish;
    end

endmodule

