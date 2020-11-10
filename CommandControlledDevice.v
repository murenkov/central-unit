/*
* Command Controlled Device
*/

module CommandControlledDevice(
    input clock, reset,
    input [3:0] data_in,

    output [3:0] data_out,
    output [2:0] port_id,
    output port_read, port_write
);

    wire [16:0] control_bus;
    reg carry_flag, zero_flag;

    RALU RALU(
        .clock  (clock),
        .reset  (reset),
        .DataIn (data_in),
        .S      (control_bus[16:13]),
        .M      (control_bus[12]),
        .Pin    (control_bus[11]),
        .ISR    (control_bus[10]),
        .ISL    (control_bus[9]),
        .A      (control_bus[8]),
        .wr     (control_bus[7]),
        .adr    (control_bus[6:4]),
        .v      (control_bus[3:0]),
        .R      (data_out),
        .Pout   (Pout)
    );

    ControlUnit ControlUnit(
        .clock       (clock),
        .reset       (reset),
        .carry_flag  (carry_flag),
        .zero_flag   (zero_flag),
        .control_bus (control_bus)
    );

    assign port_read = control_bus[8] & control_bus[0];
    assign port_write = control_bus[3];
    assign port_id = control_bus[6:4];

    always @(posedge clock or posedge reset)
        if (!reset) begin
            carry_flag <= 0;
            zero_flag <= 0;
        end
        else begin
            carry_flag <= Pout;
            zero_flag <= ~(data_out[3] | data_out[2] | data_out[1] | data_out[0]);
        end

endmodule

