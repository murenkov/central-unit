/*
* Basic Project
*/

module BasicProject(
    input CLOCK_50,
    input ps2_clock, ps2_data,
    input wire [3:0] KEY,
    output wire [6:0] HEX0, HEX1, HEX2, HEX3
);

    wire button0;
    wire [7:0] data;
    wire [31:0] frequency;
    wire [15:0] indicator;
    wire [3:0] keyboard_bus;
    wire key_pressed;

    CentralUnit CentralUnit(
        .clock        (CLOCK_50),
        .reset        (button0),
        .key_pressed  (key_pressed),
        .keyboard_bus (keyboard_bus),
        .indicator    (indicator)
    );

    PS2Keyboard PS2Keyboard(
        .clock      (CLOCK_50),
        .reset      (button0),
        .ps2_clock  (ps2_clock),
        .ps2_data   (ps2_data),
        .valid_data (valid_data),
        .data       (data)
    );

    InputModule InputModule(
        .clock        (CLOCK_50),
        .ps2_clock    (ps2_clock),
        .ps2_data     (ps2_data),
        .keys         (KEY),
        .key_pressed  (key_pressed),
        .button0      (button0),
        .frequency    (frequency),
        .keyboard_bus (keyboard_bus)
    );

    OutputModule OutputModule(
        .clock     (CLOCK_50),
        .data_0    (indicator[3:0]),
        .data_1    (indicator[7:4]),
        .data_2    (indicator[11:8]),
        .data_3    (indicator[15:12]),
        .hex_out_0 (HEX0),
        .hex_out_1 (HEX1),
        .hex_out_2 (HEX2),
        .hex_out_3 (HEX3)
    );

endmodule

