module top_module (
    input wire [2:0] sel,
    input wire [3:0] data0,
    input wire [3:0] data1,
    input wire [3:0] data2,
    input wire [3:0] data3,
    input wire [3:0] data4,
    input wire [3:0] data5,
    output reg [3:0] out
);

    // Multiplexer logic
    always @(*) begin
        case (sel)
            3'b000: out = data0;
            3'b001: out = data1;
            3'b010: out = data2;
            3'b011: out = data3;
            3'b100: out = data4;
            3'b101: out = data5;
            default: out = 4'b0000; // Default case if sel is outside 0 to 5
        endcase
    end

endmodule