/*
* Testbench for LCU.v
*/

`timescale 1us/1ns

module LCU_testbench();

    reg Pin;
    reg [3:0] D, F;

    wire [3:0] P;

    localparam PERIOD = 0.5;

    LCU UUT(
        .Pin        (Pin),
        .D          (D),
        .F          (F),
        .P          (P)
    );

    initial begin
        $dumpfile("./LCU.vcd");
        $dumpvars(0, LCU_testbench);

        Pin = 0;
        D = 4'b0000;
        F = 4'b0000;
        #PERIOD;
        
        Pin = 0;
        D = 4'b0101;
        F = 4'b1111;
        #PERIOD;
        
        Pin = 1;
        D = 4'b1111;
        F = 4'b1000;
        #PERIOD;
        
        Pin = 1;
        D = 4'b1010;
        F = 4'b0011;
        #PERIOD;
        
    end

endmodule
