module InputModule(
    input clock,
    input [3:0] keys,
    input ps2_clock,
    input ps2_data,
    output [31:0] frequency,
    output reg [3:0] keyboard_bus,
    output key_pressed,
    output button0, button1, button2, button3
);

    localparam KEY_0 = 8'h45;
    localparam KEY_1 = 8'h16;
    localparam KEY_2 = 8'h1E;
    localparam KEY_3 = 8'h26;
    localparam KEY_4 = 8'h25;
    localparam KEY_5 = 8'h2E;
    localparam KEY_6 = 8'h36;
    localparam KEY_7 = 8'h3D;
    localparam KEY_8 = 8'h3E;
    localparam KEY_9 = 8'h46;
    localparam KEY_A = 8'h1C;
    localparam KEY_B = 8'h32;
    localparam KEY_C = 8'h21;
    localparam KEY_D = 8'h23;
    localparam KEY_E = 8'h24;
    localparam KEY_F = 8'h2B;

    assign {button3, button2, button1, button0} = keys;
    wire [7:0] data;

    always @(posedge clock)
        case (data)
            KEY_0: keyboard_bus <= 4'h0;
            KEY_1: keyboard_bus <= 4'h1;
            KEY_2: keyboard_bus <= 4'h2;
            KEY_3: keyboard_bus <= 4'h3;
            KEY_4: keyboard_bus <= 4'h4;
            KEY_5: keyboard_bus <= 4'h5;
            KEY_6: keyboard_bus <= 4'h6;
            KEY_7: keyboard_bus <= 4'h7;
            KEY_8: keyboard_bus <= 4'h8;
            KEY_9: keyboard_bus <= 4'h9;
            KEY_A: keyboard_bus <= 4'hA;
            KEY_B: keyboard_bus <= 4'hB;
            KEY_C: keyboard_bus <= 4'hC;
            KEY_D: keyboard_bus <= 4'hD;
            KEY_E: keyboard_bus <= 4'hE;
            KEY_F: keyboard_bus <= 4'hF;
        endcase

    PS2Keyboard PS2Keyboard(    
        .clock      (clock),
        .reset      (button0),
        .ps2_clock  (ps2_clock),
        .ps2_data   (ps2_data),
        .data       (data),
        .valid_data (key_pressed)
    );

    FrequencyDivider FreqDiv0(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**1),
        .clock_out (frequency[0])
    );

    FrequencyDivider FreqDiv1(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**2),
        .clock_out (frequency[1])
    );

    FrequencyDivider FreqDiv2(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**3),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv3(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**4),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv4(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**5),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv5(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**6),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv6(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**7),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv7(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**8),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv8(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**9),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv9(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**10),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv10(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**11),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv11(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**12),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv12(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**13),
        .clock_out (frequency[2])
    );

    FrequencyDivider FreqDiv31(
        .clock_in  (clock),
        .reset     (button0),
        .divisor   (2**31),
        .clock_out (frequency[2])
    );

endmodule 

