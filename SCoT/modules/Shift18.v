module top_module (
    input wire clk,
    input wire load,
    input wire ena,
    input wire [1:0] amount,
    input wire [63:0] data,
    output reg [63:0] q
);
    always @(posedge clk) begin
        // Check if load is high to load data into the register.
        if (load) begin
            q <= data;
        end
        else if (ena) begin
            // Perform the shift operation based on the amount signal.
            case (amount)
                2'b00: q <= q << 1;          // Shift left by 1 bit
                2'b01: q <= q << 8;          // Shift left by 8 bits
                2'b10: q <= $signed(q) >>> 1; // Arithmetic shift right by 1 bit
                2'b11: q <= $signed(q) >>> 8; // Arithmetic shift right by 8 bits
                default: q <= q;              // Default case (should never happen)
            endcase
        end
    end
endmodule