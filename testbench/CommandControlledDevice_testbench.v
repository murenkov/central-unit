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

        // 1st clock
        // Reset
        reset = 1;
        data_in = 0;
        #PERIOD;

        // 2nd clock
        // Read C
        reset = 0;
        data_in = 1;
        #PERIOD;

        // 3rd clock
        // Write C to GPRB[0]
        reset = 0;
        data_in = 1;
        #PERIOD;

        // 4th clock
        // Read A
        reset = 0;
        data_in = 3;
        #PERIOD;

        // 5th clock
        // Write A to GPRB[1]
        reset = 0;
        data_in = 3;
        #PERIOD;

        // 6th clock
        // Read B
        reset = 0;
        data_in = 5;
        #PERIOD;

        // 7th clock
        // Write B to GPRB[2]
        reset = 0;
        data_in = 5;
        #PERIOD;

        // 8th clock
        // Send A from GPRB[1] to regB
        reset = 0;
        data_in = 0;
        #PERIOD;

        // 9th clock
        // Get sum of A and B and write result to GPRB[2]
        #PERIOD;
        
        // 10th clock
        // Shift to left data in regB
        #PERIOD;
        
        // 11th clock
        // Shift to left data in regB
        #PERIOD;
        
        // 12th clock
        // Shift to left data in regB and send GPRB[2] in regA
        #PERIOD;
        
        // 13th clock
        // Bitwise and of data from registers A and B then send to GPRB[1]
        #PERIOD;
        
        // 14th clock
        // Send data from GPRB[0] to regB
        #PERIOD;
        
        // 15th clock
        // Send data from GPRB[1] to regA
        #PERIOD;
        
        // 16th clock
        // regA (R) - regB (C) 
        #PERIOD;
        
        // 17th clock
        // If (cond) goto 1
        #PERIOD;
        
        // 18th clock
        reset = 0;
        data_in = 15;
        #PERIOD;

        // 19th clock
        reset = 0;
        data_in = 15;
        #PERIOD;

        // 20th clock
        reset = 0;
        data_in = 14;
        #PERIOD;

        // 21th clock
        reset = 0;
        data_in = 14;
        #PERIOD;

        // 22th clock
        reset = 0;
        data_in = 13;
        #PERIOD;

        // 23th clock
        reset = 0;
        data_in = 13;
        #PERIOD;

        // 23th clock
        reset = 0;
        data_in = 0;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        
        $finish;
    end

endmodule

