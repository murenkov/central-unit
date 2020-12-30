module DataInput(
    input clock, reset,
    input [3:0] keyboard_bus,
    input key_pressed,
    input port_id,
    input port_read,

    output [3:0] data_out
);

reg key_pressed_previous, ready;
reg [3:0] data;

always @(posedge clock)
    if (reset) begin
        key_pressed_previous  <= 1'b0;
        data <= 4'b0;
    end
    else begin
        key_pressed_previous <= key_pressed;
        if (key_pressed & ~key_pressed_previous)
            data <= keyboard_bus;
    end
    
always @(posedge clock)
    if (reset | (port_read & ready & ~port_id))
        ready <= 1'b0;
    else if (key_pressed & ~key_pressed_previous)
        ready <= 1'b1;

assign data_out = port_id ? data : {3'b000, ready};

endmodule

