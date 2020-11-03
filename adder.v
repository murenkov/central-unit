/*
* 1 bit adder
*/

module adder(
    input a, b,
    input [3:0] S,
    input M,
    input Pin,

    output D, F,
    output R,
    output Pout
);

    assign D = S[3] & a & b | S[2] & a & ~b;
    assign F = a | S[1] & ~b | S[0] & b;
    assign R = (S[3] & a & b | S[2] & a & ~b) ^ (a | S[1] & ~b | S[0] & b) ^ M & Pin; 
    assign Pout = D | F & Pin;

endmodule

