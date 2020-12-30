/*
* Parallel 4 bit ALU
*/

module ParallelALU(
    input [3:0] A, B,
    input [3:0] S,
    input M,
    input Pin,

    output [3:0] R,
    output [3:0] P,
    output Pout
);
    wire [3:0] D, F;

    LCU LCU(
        .Pin(Pin),
        .D (D),
        .F (F),
        .P (P)
    );

    genvar i;
    generate
        Adder Adder0(
            .a    (A[0]),
            .b    (B[0]),
            .S    (S),
            .M    (M),
            .Pin  (Pin),
            .D    (D[0]),
            .F    (F[0]),
            .R    (R[0])
        );

        for (i = 1; i < 4; i = i + 1) begin : Adder1
            Adder Adder(
                .a    (A[i]),
                .b    (B[i]),
                .S    (S),
                .M    (M),
                .Pin  (P[i-1]),
                .D    (D[i]),
                .F    (F[i]),
                .R    (R[i])
            );
        end
    endgenerate

    assign Pout = P[3];

endmodule

