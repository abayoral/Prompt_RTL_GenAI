module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end else begin
            integer i;
            reg [511:0] next_q;
            for (i = 0; i < 512; i = i + 1) begin
                if (i == 0) begin
                    // Boundary condition for the first cell (left neighbor is zero)
                    next_q[i] = q[i+1] ^ (q[i] | q[i+1]);
                end else if (i == 511) begin
                    // Boundary condition for the last cell (right neighbor is zero)
                    next_q[i] = q[i-1];
                end else begin
                    // General case for cells with both neighbors
                    next_q[i] = ((~q[i-1] & q[i]) | (q[i] & q[i+1]) | (q[i-1] & ~q[i+1]));
                end
            end
            q <= next_q;
        end
    end

endmodule