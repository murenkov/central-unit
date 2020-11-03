/*
* Parallel 4 bit ALU
*/

module parallel_ALU(
    input [3:0] A, B,
    input [3:0] S,
    input M,
    input Pin,

    output [3:0] R,
    output [3:0] P
);
    wire [3:0] D, F;

    LCU LCU(
        .Pin(Pin),
        .D (D),
        .F (F),
        .P (P)
    );

    adder adder_0(
        .a    (A[0]),
        .b    (B[0]),
        .S    (S),
        .M    (M),
        .Pin  (Pin),
        .D    (D[0]),
        .F    (F[0]),
        .R    (R[0])
    );

    adder adder_1(
        .a    (A[1]),
        .b    (B[1]),
        .S    (S),
        .M    (M),
        .Pin  (P[0]),
        .D    (D[1]),
        .F    (F[1]),
        .R    (R[1])
    );

    adder adder_2(
        .a    (A[2]),
        .b    (B[2]),
        .S    (S),
        .M    (M),
        .Pin  (P[1]),
        .D    (D[2]),
        .F    (F[2]),
        .R    (R[2])
    );

    adder adder_3(
        .a    (A[3]),
        .b    (B[3]),
        .S    (S),
        .M    (M),
        .Pin  (P[2]),
        .D    (D[3]),
        .F    (F[3]),
        .R    (R[3])
    );

endmodule

