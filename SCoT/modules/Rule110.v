module top_module (
    input wire clk,
    input wire load,
    input wire [511:0] data,
    output reg [511:0] q
);

    reg [511:0] next_q;

    always @(posedge clk or posedge load) begin
        if (load)
            q <= data;
        else begin
            integer i;
            for (i = 0; i < 512; i = i + 1) begin
                // Determine the states of the left neighbor, the current cell, and the right neighbor
                wire left = (i == 0) ? 1'b0 : q[i-1];
                wire center = q[i];
                wire right = (i == 511) ? 1'b0 : q[i+1];

                // Implement Rule 110 logic
                case ({left, center, right})
                    3'b111: next_q[i] = 1'b0;
                    3'b110: next_q[i] = 1'b1;
                    3'b101: next_q[i] = 1'b1;
                    3'b100: next_q[i] = 1'b0;
                    3'b011: next_q[i] = 1'b1;
                    3'b010: next_q[i] = 1'b1;
                    3'b001: next_q[i] = 1'b1;
                    3'b000: next_q[i] = 1'b0;
                    default: next_q[i] = 1'b0;
                endcase
            end
            q <= next_q;
        end
    end
endmodule