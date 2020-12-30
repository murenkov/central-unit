/*
* Register ALU
*/

module RALU(
    input        clock,
    input        reset,
    
    input  [3:0] DataIn,

    input  [3:0] S,
    input        M,
    input        Pin,
    input        ISR,
    input        ISL,
    input        A,
    input        wr,
    input  [2:0] adr,
    input  [3:0] v,

    output   reg OSR,
    output   reg OSL,
    output       Pout,
    output [3:0] R
);

    reg [3:0] regA;
    reg [3:0] regB;
    reg [3:0] GPRB [0:7];

    ParallelALU ALU(
        .A        (regA),
        .B        (regB),
        .S        (S),
        .M        (M),
        .Pin      (Pin),
        .R        (R),
        .Pout     (Pout)
    );

    // Register A
    always @(posedge clock or posedge reset)
        if (reset)
            regA <= 4'b0000;
        else if (v[0])
            regA <= A ? DataIn : GPRB[adr];

    // Register B
    always @(posedge clock or posedge reset)
        if (reset)
            regB <= 4'b0000;
        else case (v[2:1])
            2'b00:
                ;

            2'b01:
                {OSL, regB} <= {regB, ISL};

            2'b10:
                {regB, OSR} <= {ISR, regB};

            2'b11:
                regB <= GPRB[adr];
        endcase
    
    // General Purpose Register Block
    integer i;
    always @(posedge clock or posedge reset)
        if (reset)
            for (i = 0; i < 8; i = i + 1)
                GPRB[i] <= 4'b0000;
        else if (wr)
            GPRB[adr] <= R;

endmodule

