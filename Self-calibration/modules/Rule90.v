module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q ); 

    reg [511:0] next_q;
    integer i;

    always @(posedge clk) begin
        if (load) begin
            q <= data;
        end
        else begin
            next_q[0] <= 0 ^ q[1];      // Left boundary neighbor is assumed 0
            for (i = 1; i < 511; i = i + 1) begin
                next_q[i] <= q[i-1] ^ q[i+1];
            end
            next_q[511] <= q[510] ^ 0;   // Right boundary neighbor is assumed 0
            q <= next_q;
        end
    end

endmodule