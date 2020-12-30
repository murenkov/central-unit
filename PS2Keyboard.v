module PS2Keyboard( 
          input clock, reset,
          input ps2_clock, ps2_data, 
          output reg valid_data, 
          output [7:0] data
); 

reg [8:0] shift_reg;
reg [3:0] count_bit;

assign data = shift_reg[7:0];

function parity_calc;
    input [7:0] data;
    parity_calc = ~^data;
endfunction

reg [9:0] ps2_clock_detect;

always @(posedge clock or posedge reset)
begin
    if (reset)
        ps2_clock_detect <= 10'd0;
    else
        ps2_clock_detect <= {ps2_clock, ps2_clock_detect[9:1]};
end

wire ps2_clock_negedge = &ps2_clock_detect[4:0] && &(~ps2_clock_detect[9:5]);

reg [1:0] state;

localparam IDLE = 2'd0;
localparam RECEIVE_DATA = 2'd1;
localparam CHECK_PARITY_STOP_BITS = 2'd2;

always @(posedge clock or posedge reset)
    if (reset)
        state <= IDLE;
    else if (ps2_clock_negedge)
        case (state)
            IDLE:
                if (!ps2_data)
                    state <= RECEIVE_DATA;

            RECEIVE_DATA:
                if (count_bit == 8)
                    state <= CHECK_PARITY_STOP_BITS;

            CHECK_PARITY_STOP_BITS:
                state <= IDLE;

            default:
                state <= IDLE;
      endcase

always @(posedge clock or posedge reset)
    if (reset)
        valid_data <= 1'b0;
    else if (ps2_clock_negedge)
        if (ps2_data &&
            parity_calc(shift_reg[7:0]) == shift_reg[8] &&
            state == CHECK_PARITY_STOP_BITS
        )
            valid_data <= 1'b1;
        else
            valid_data <= 1'b0;

always @(posedge clock or posedge reset)
    if (reset)
        shift_reg <= 9'b0;
    else if (ps2_clock_negedge)
        if (state == RECEIVE_DATA)
            shift_reg <= {ps2_data, shift_reg[8:1]};

always @(posedge clock or posedge reset)
    if (reset)
        count_bit <= 4'b0;
    else if (ps2_clock_negedge)
        if (state == RECEIVE_DATA)
            count_bit <= count_bit + 4'b1;
        else
            count_bit <= 4'b0;

endmodule

