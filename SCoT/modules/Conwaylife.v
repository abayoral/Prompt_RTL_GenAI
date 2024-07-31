module top_module (
    input wire clk,
    input wire load,
    input wire [255:0] data,
    output reg [255:0] q
);

    // Internal signals for storing current and next state
    reg [15:0][15:0] current_grid;
    reg [15:0][15:0] next_grid;

    integer r, c, rr, cc, neighbors;

    // Function to count neighbors
    function integer count_neighbors(input integer r, input integer c);
        integer rr, cc, count;
        begin
            count = 0;
            for (rr = -1; rr <= 1; rr = rr + 1) begin
                for (cc = -1; cc <= 1; cc = cc + 1) begin
                    if (!(rr == 0 && cc == 0)) begin
                        count = count + current_grid[(r + rr + 16) % 16][(c + cc + 16) % 16];
                    end
                end
            end
            count_neighbors = count;
        end
    endfunction

    always @(posedge clk) begin
        // Load initial data if load is high
        if (load) begin
            for (r = 0; r < 16; r = r + 1) begin
                for (c = 0; c < 16; c = c + 1) begin
                    current_grid[r][c] = data[r * 16 + c];
                end
            end
        end else begin
            // Update the grid based on Game of Life rules
            for (r = 0; r < 16; r = r + 1) begin
                for (c = 0; c < 16; c = c + 1) begin
                    neighbors = count_neighbors(r, c);
                    if (neighbors < 2 || neighbors > 3)
                        next_grid[r][c] = 0;
                    else if (neighbors == 3)
                        next_grid[r][c] = 1;
                    else
                        next_grid[r][c] = current_grid[r][c];
                end
            end
            
            // Update current grid with next state
            for (r = 0; r < 16; r = r + 1) begin
                for (c = 0; c < 16; c = c + 1) begin
                    current_grid[r][c] = next_grid[r][c];
                end
            end
        end

        // Flatten the 2D current_grid to q output
        for (r = 0; r < 16; r = r + 1) begin
            for (c = 0; c < 16; c = c + 1) begin
                q[r * 16 + c] = current_grid[r][c];
            end
        end
    end
endmodule