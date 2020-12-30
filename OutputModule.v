module OutputModule(
    input clock,
    input [3:0] data_0, data_1, data_2, data_3,
    output [6:0] hex_out_0, hex_out_1, hex_out_2, hex_out_3
);

    SevenSegmentDisplay SSeg0(
        .data_in (data_0),
        .hex_out (hex_out_0)
    );

    SevenSegmentDisplay SSeg1(
        .data_in (data_1),
        .hex_out (hex_out_1)
    );

    SevenSegmentDisplay SSeg2(
        .data_in (data_2),
        .hex_out (hex_out_2)
    );

    SevenSegmentDisplay SSeg3(
        .data_in (data_3),
        .hex_out (hex_out_3)
    );

endmodule 

