module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q );

    reg [15:0][15:0] grid;
    
    // Function to count the number of alive neighbors
    function [3:0] count_neighbors;
        input [15:0][15:0] g;
        input [4:0] x, y;
        integer i, j;
        begin
            count_neighbors = 0;
            for (i = -1; i <= 1; i = i + 1) begin
                for (j = -1; j <= 1; j = j + 1) begin
                    if (i != 0 || j != 0) begin
                        count_neighbors = count_neighbors + g[(x+i+16)%16][(y+j+16)%16];
                    end
                end
            end
        end
    endfunction
    
    // Sequential logic for setting grid values
    always @(posedge clk) begin
        integer i, j;
        reg [15:0][15:0] next_grid;
        if (load) begin
            // Load data into grid
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    grid[i][j] = data[i * 16 + j];
                end
            end
        end else begin
            // Compute next state of the grid
            for (i = 0; i < 16; i = i + 1) begin
                for (j = 0; j < 16; j = j + 1) begin
                    case (count_neighbors(grid, i, j))
                        4'b0000, 4'b0001: next_grid[i][j] = 0;  // Cell dies
                        4'b0010: next_grid[i][j] = grid[i][j]; // Cell stays the same
                        4'b0011: next_grid[i][j] = 1;          // Cell becomes alive
                        default: next_grid[i][j] = 0;          // Cell dies
                    endcase
                end
            end
            // Update the grid
            grid <= next_grid;
        end
    end
    
    // Combinational logic to output the grid state
    always @(*) begin
        integer x, y;
        for (x = 0; x < 16; x = x + 1) begin
            for (y = 0; y < 16; y = y + 1) begin
                q[x * 16 + y] = grid[x][y];
            end
        end
    end
    
endmodule