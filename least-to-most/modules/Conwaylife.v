module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

// Define the grid as a 2D array for easier handling.
reg [15:0] grid[15:0];
reg [15:0] new_grid[15:0];

integer i, j;

// Load initial state into the grid.
always @(posedge clk) begin
    if (load) begin
        for (i = 0; i < 16; i = i + 1) begin
            grid[i] <= data[i*16 +: 16];
        end
    end else begin
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                // Calculate the number of neighbors.
                integer neighbors;
                neighbors = grid[(i-1) & 4'hF][(j-1) & 4'hF] +
                            grid[(i-1) & 4'hF][ j     & 4'hF] +
                            grid[(i-1) & 4'hF][(j+1) & 4'hF] +
                            grid[ i    & 4'hF][(j-1) & 4'hF] +
                            grid[ i    & 4'hF][(j+1) & 4'hF] +
                            grid[(i+1) & 4'hF][(j-1) & 4'hF] +
                            grid[(i+1) & 4'hF][ j     & 4'hF] +
                            grid[(i+1) & 4'hF][(j+1) & 4'hF];

                // Determine the next state of the cell.
                if (neighbors == 3 || (neighbors == 2 && grid[i][j])) begin
                    new_grid[i][j] = 1;
                end else begin
                    new_grid[i][j] = 0;
                end
            end
        end

        // Update grid state.
        for (i = 0; i < 16; i = i + 1) begin
            grid[i] <= new_grid[i];
        end
    end
end

// Flatten the 2D grid into a 1D output vector.
always @(*) begin
    for (i = 0; i < 16; i = i + 1) begin
        q[i*16 +: 16] = grid[i];
    end
end

endmodule