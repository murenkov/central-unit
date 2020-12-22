module FrequencyDivider(
    input clock_in,
    input reset,
    input [31:0] divisor,

    output clock_out
);

    reg [31:0] counter;

    always @(posedge clock_in or posedge reset) begin
        if (reset)
            counter <= 32'd0;
        else if (counter >= (divisor - 1))
            counter <= 32'd0;
        else
            counter <= counter + 32'd1;
    end

    assign clock_out = (counter < divisor / 2) ? 1'b1 : 1'b0;

endmodule

