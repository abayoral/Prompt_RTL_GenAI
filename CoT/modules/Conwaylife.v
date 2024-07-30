module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    reg [255:0] current_state;
    reg [255:0] next_state;

    // Function to count the number of alive neighbors
    function [3:0] count_neighbors;
        input [3:0] x, y; // position in the grid
        integer dx, dy;
        reg [3:0] count;
    begin
        count = 0;
        for (dx = -1; dx <= 1; dx = dx + 1) begin
            for (dy = -1; dy <= 1; dy = dy + 1) begin
                if (!(dx == 0 && dy == 0)) begin // skip the cell itself
                    // wrap-around using modulo
                    if (current_state[(((x + dx + 16) % 16) * 16) + ((y + dy + 16) % 16)]) begin
                        count = count + 1;
                    end
                end
            end
        end
        count_neighbors = count;
    end
    endfunction

    // Compute the next state based on the current state and neighbor counts
    integer i, j;
    always @(*) begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                case (count_neighbors(i, j))
                    4'b0011: next_state[(i * 16) + j] = 1; // 3 neighbors
                    4'b0010: next_state[(i * 16) + j] = current_state[(i * 16) + j]; // 2 neighbors
                    default: next_state[(i * 16) + j] = 0; // 0-1 or 4+ neighbors
                endcase
            end
        end
    end

    // Update the state on every clock cycle
    always @(posedge clk) begin
        if (load)
            current_state <= data;
        else
            current_state <= next_state;
        
        q <= current_state;
    end

endmodule