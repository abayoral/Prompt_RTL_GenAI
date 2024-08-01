module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q
);

    reg [15:0] grid [15:0]; // Create a 2D array to represent the 16x16 grid
    reg [15:0] next_grid [15:0];
    integer i, j, x, y, neighbors;

    always @(posedge clk) begin
        if (load) begin
            // load the initial state into the 2D grid array
            for (i = 0; i < 16; i = i + 1) begin
                grid[i] <= data[i*16 +: 16];
            end
        end else begin
            // Next state computation
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    neighbors = 0;

                    // Count the number of neighbors
                    for (x = -1; x <= 1; x = x + 1) begin
                        for (y = -1; y <= 1; y = y + 1) begin
                            if (x != 0 || y != 0) begin
                                if (grid[(i+x+16)%16][(j+y+16)%16])
                                    neighbors = neighbors + 1;
                            end
                        end
                    end

                    // Apply the rules of Conway's Game of Life
                    if (neighbors < 2 || neighbors > 3)
                        next_grid[i][j] = 0;
                    else if (neighbors == 3)
                        next_grid[i][j] = 1;
                    else
                        next_grid[i][j] = grid[i][j]; // stays the same for neighbors == 2
                end
            end

            // Update the grid with the next state
            for (i = 0; i < 16; i = i + 1) begin
                grid[i] <= next_grid[i];
            end
        end
    end

    // Flatten the 2D array back into the 1D output vector
    always @(*) begin
        for (i = 0; i < 16; i = i + 1) begin
            q[i*16 +: 16] = grid[i];
        end
    end

endmodule