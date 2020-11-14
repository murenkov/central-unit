/*
* Serial 4bit ALU
*/

module SerialALU(
    input [3:0] A, B,
    input [3:0] S,
    input M,
    input Pin,

    output [3:0] R,
    output [3:0] P
);

    Adder Adder0(
        .a    (A[0]),
        .b    (B[0]),
        .S    (S),
        .M    (M),
        .Pin  (Pin),
        .R    (R[0]),
        .Pout (P[0])
    );

    Adder Adder1(
        .a    (A[1]),
        .b    (B[1]),
        .S    (S),
        .M    (M),
        .Pin  (P[0]),
        .R    (R[1]),
        .Pout (P[1])
    );

    Adder Adder2(
        .a    (A[2]),
        .b    (B[2]),
        .S    (S),
        .M    (M),
        .Pin  (P[1]),
        .R    (R[2]),
        .Pout (P[2])
    );

    Adder Adder3(
        .a    (A[3]),
        .b    (B[3]),
        .S    (S),
        .M    (M),
        .Pin  (P[2]),
        .R    (R[3]),
        .Pout (P[3])
    );

endmodule

