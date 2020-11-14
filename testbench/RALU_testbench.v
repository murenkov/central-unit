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
    reg        ISR;
    reg        ISL;
    reg        A;
    reg        wr;
    reg  [2:0] adr;
    reg  [3:0] v;

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

        // 1st clock signal
        // Reset
        reset = 1;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0000;
        #PERIOD;
        
        // 2nd clock signal
        // Read data from data_in to register A
        reset = 0;
        DataIn = 3;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 1;
        wr = 0;
        adr = 0;
        v = 4'b0001;
        #PERIOD;
        
        // 3rd clock signal
        // Send data from registr A to GPRB[0]
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 1;
        adr = 0;
        v = 4'b0000;
        #PERIOD;
        
        // 4th clock signal
        // Read data from data_in to register A
        reset = 0;
        DataIn = 12;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 1;
        wr = 0;
        adr = 0;
        v = 4'b0001;
        #PERIOD;
        
        // 5th clock signal
        // Send data from register A to GPRB[1]
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 1;
        adr = 1;
        v = 4'b0000;
        #PERIOD;
        
        // 6th clock signal
        // Send data from GPRB[0] to register A
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0001;
        #PERIOD;
        
        // 7th clock signal
        // Send data from GPRB[1] to register B
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 1;
        v = 4'b0110;
        #PERIOD;
        
        // 8th clock signal
        // Get sum of data from registers A and B, then send result to GPRB[1]
        reset = 0;
        DataIn = 0;
        S = 4'b1001;
        M = 1;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 1;
        adr = 1;
        v = 4'b0000;
        #PERIOD;
        
        // 9th clock signal
        // Send data from GPRB[0] to register B
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0110;
        #PERIOD;
        
        // 10th clock signal
        // Shift to left data in register B
        reset = 0;
        DataIn = 0;
        S = 4'b0101;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0010;
        #PERIOD;
        
        // 11th clock signal
        // Shift to left data in register B
        reset = 0;
        DataIn = 0;
        S = 4'b0101;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0010;
        #PERIOD;
        
        // 12th clock signal
        // Shift to left data in register B and send result to GPRB[0]
        reset = 0;
        DataIn = 0;
        S = 4'b0101;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 1;
        adr = 0;
        v = 4'b0010;
        #PERIOD;
        
        // 13th clock signal
        // Send data from GPRB[1] to register A
        reset = 0;
        DataIn = 0;
        S = 4'b0000;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 1;
        v = 4'b0001;
        #PERIOD;
        
        // 14th clock signal
        // Bitwise and of data from registers A and B
        reset = 0;
        DataIn = 0;
        S = 4'b0100;
        M = 0;
        Pin = 0;
        ISR = 0;
        ISL = 0;
        A = 0;
        wr = 0;
        adr = 0;
        v = 4'b0000;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        #PERIOD;
        
        $finish;
    end

endmodule

