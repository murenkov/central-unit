/*
* Central Unit
*/

module CentralUnit(
    input clock, reset,
    input [3:0] keyboard_bus,
    input key_pressed,

    output [15:0] indicator
);

    wire [3:0] data_in, data_out;
    wire [2:0] port_id;
    wire port_read, port_write;

    CommandControlledDevice CCD(
        .clock      (clock),
        .reset      (reset),
        .data_in    (data_in),
        .data_out   (data_out),
        .port_read  (port_read),
        .port_write (port_write),
        .port_id    (port_id)
    );

    DataInput DataInput(
        .clock        (clock),
        .reset        (reset),
        .keyboard_bus (keyboard_bus),
        .key_pressed  (key_pressed),
        .port_id      (port_id[0]),
        .port_read    (port_read),
        .data_out     (data_in)
    );

    DataOutput DataOutput(
        .clock     (clock),
        .reset     (reset),
        .rw        (port_write),
        .data      (data_out),
        .port_id   (port_id[1:0]),
        .indicator (indicator)
    );

endmodule

