/*
* Testbench for BasicProject.v
*/

`timescale 1us/1ns

module BasicProject_testbench();

    reg clock;
    reg reset;

    reg ps2_clock;
    reg ps2_data;

    wire [6:0] HEX0, HEX1, HEX2, HEX3;

    wire [3:0] keys;
    assign keys = {3'b000, reset};

    BasicProject UUT( 
        .KEY       (keys),
        .CLOCK_50  (clock),

        .ps2_clock (ps2_clock), 
        .ps2_data  (ps2_data), 
          
        .HEX0      (HEX0),
        .HEX1      (HEX1),
        .HEX2      (HEX2),
        .HEX3      (HEX3)
    ); 

    localparam KEY_0 = 8'h45;
    localparam KEY_1 = 8'h16;
    localparam KEY_2 = 8'h1E;
    localparam KEY_3 = 8'h26;
    localparam KEY_4 = 8'h25;
    localparam KEY_5 = 8'h2E;
    localparam KEY_6 = 8'h36;
    localparam KEY_7 = 8'h3D;
    localparam KEY_8 = 8'h3E;
    localparam KEY_9 = 8'h46;
    localparam KEY_A = 8'h1C;
    localparam KEY_B = 8'h32;
    localparam KEY_C = 8'h21;
    localparam KEY_D = 8'h23;
    localparam KEY_E = 8'h24;
    localparam KEY_F = 8'h2B;

    initial begin
        $dumpfile("./BasicProject.vcd");
        $dumpvars(0, BasicProject_testbench);
    end

    initial begin
        clock = 0;
        reset = 0;

        ps2_clock = 1;
        ps2_data = 1;

        #20
        reset = 1;
        #20
        reset = 0;

        #1000
        ps2_send(KEY_A);
        #1000
        ps2_send(KEY_1);
        #1000
        ps2_send(KEY_E);
        #1000
        #5000

        #1000
        ps2_send(KEY_7);
        #1000
        ps2_send(KEY_3);
        #1000
        ps2_send(KEY_E);
        #1000
        #5000

        ps2_send(KEY_2);
        #1000
        ps2_send(KEY_E);
        #1000
        #5000

        #20
        reset = 1;
        #20
        reset = 0;

        #50000
        $finish;
    end


    always
        #20 clock = ~clock;

    localparam PS2_HALFPERIOD = 1000;
    reg [7:0] ps2_shiftreg;

    integer i;

    task ps2_send;
        input [7:0] data;

        begin
            ps2_shiftreg = data;

            // Start bit
            ps2_clock = 0;
            ps2_data  = 0;
            #PS2_HALFPERIOD;
            ps2_clock = 1;
            #PS2_HALFPERIOD;

            // Data
            for (i = 0; i < 8; i = i + 1) begin
                ps2_clock = 0;
                ps2_data  = ps2_shiftreg[0];
                ps2_shiftreg = ps2_shiftreg >> 1;
                #PS2_HALFPERIOD;
                ps2_clock    = 1;
                #PS2_HALFPERIOD;
            end

            // Parity
            ps2_clock = 0;
            ps2_data  = ~(^data);
            #PS2_HALFPERIOD;
            ps2_clock = 1;
            #PS2_HALFPERIOD;

            // Stop bit
            ps2_clock = 0;
            ps2_data  = 1;
            #PS2_HALFPERIOD;
            ps2_clock = 1;
            #PS2_HALFPERIOD;

            // One period delay
            #(PS2_HALFPERIOD * 2);
        end
    endtask

endmodule

