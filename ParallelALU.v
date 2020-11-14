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

    Adder Adder1(
        .a    (A[1]),
        .b    (B[1]),
        .S    (S),
        .M    (M),
        .Pin  (P[0]),
        .D    (D[1]),
        .F    (F[1]),
        .R    (R[1])
    );

    Adder Adder2(
        .a    (A[2]),
        .b    (B[2]),
        .S    (S),
        .M    (M),
        .Pin  (P[1]),
        .D    (D[2]),
        .F    (F[2]),
        .R    (R[2])
    );

    Adder Adder3(
        .a    (A[3]),
        .b    (B[3]),
        .S    (S),
        .M    (M),
        .Pin  (P[2]),
        .D    (D[3]),
        .F    (F[3]),
        .R    (R[3])
    );
    
    assign Pout = P[3];

endmodule

