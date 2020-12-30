module DataOutput(
    input clock, reset,
    input rw,
    input [3:0] data,
    input [1:0] port_id,

    output reg [15:0] indicator
);

    always @ (posedge clock)
        if (reset)
            indicator <= 16'b0;
        else if (rw)
            case (port_id)
                2'b00: indicator[3:0]   <= data;
                2'b01: indicator[7:4]   <= data;
                2'b10: indicator[11:8]  <= data;
                2'b11: indicator[15:12] <= data;
            endcase

endmodule

