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
    input        A,
    input  [3:0] v,
    input        wr,
    input  [2:0] adr,
    input        ISR,
    input        ISL,

    output   reg OSR,
    output   reg OSL,
    output       Pout,
    output [3:0] R
);

    reg [3:0] regA;
    reg [3:0] regB;
    wire [3:0] P;
    reg [7:0] GPRB [3:0];

    parallel_ALU ALU(
        .A        (regA),
        .B        (regB),
        .S        (S),
        .M        (M),
        .Pin      (Pin),
        .R        (R),
        .Pout     (Pout)
    );

    // Register A
    always @(posedge clock or posedge reset) begin
        if (reset)
            regA <= 0;
        else if (v[0])
            regA <= A ? DataIn : GPRB[adr];
    end

    // Register B
    always @(posedge clock or posedge reset) begin
        if (reset)
            regB <= 0;
        else case (v[2:1])
            2'b00:
                ;

            2'b01:
                {OSL, regB} = {regB, ISL};

            2'b10:
                {regB, OSR} = {ISR, regB};

            2'b11:
                regB <= GPRB[adr];
        endcase
    end
    
    // General Purpose Register Block
    integer i;
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 8; i = i + 1)
                GPRB[i] = 4'b0000;
        end
        else
            GPRB[adr] = wr ? DataIn : GPRB[adr];
    end

endmodule

