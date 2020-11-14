/*
* Control Unit
*/
module ControlUnit(
    input clock, reset,
    input carry_flag, zero_flag,

    output [16:0] control_bus
);

    reg [19:0] ROM [0:127];
    initial $readmemb("commands_2.bin", ROM);
    reg [6:0] program_counter = 0;
    wire [19:0] command;

    assign command = ROM[program_counter];
    assign control_bus = (command[19:17] != 0) ? 17'b0 : command[16:0];

    always @(posedge clock or posedge reset)
        if (reset)
            program_counter <= 0;
        else case (command[19:17])
            3'b000:
                program_counter <= program_counter + 1;

            3'b001:
                program_counter <= (!zero_flag) ? command[6:0] : program_counter + 1;

            3'b010:
                program_counter <= (carry_flag && !zero_flag) ? command[6:0] : program_counter + 1;

            3'b011:
                program_counter <= (!carry_flag && !zero_flag) ? command[6:0] : program_counter + 1;

            3'b100:
                program_counter <= (zero_flag) ? command[6:0] : program_counter + 1;

            3'b101:
                program_counter <= (carry_flag && zero_flag) ? command[6:0] : program_counter + 1;

            3'b110:
                program_counter <= (!carry_flag && zero_flag) ? command[6:0] : program_counter + 1;

            3'b111:
                program_counter <= command[6:0];
        endcase

endmodule

