module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
); 
    reg [511:0] current_state, next_state;

    always @(posedge clk) begin
        if (load)
            current_state <= data;
        else
            current_state <= next_state;
    end
    
    integer i;
    always @(*) begin
        for (i = 0; i < 512; i = i + 1) begin
            if (i == 0) begin
                // Left boundary
                next_state[i] = (current_state[0] & current_state[1]) |
                                (current_state[1] & ~current_state[0]) |
                                (current_state[0] & ~current_state[1]);
            end else if (i == 511) begin
                // Right boundary
                next_state[i] = (current_state[511] & current_state[510]) |
                                (current_state[510] & ~current_state[511]) |
                                (current_state[511] & ~current_state[510]);
            end else begin
                // General case
                next_state[i] = (current_state[i-1] & current_state[i] & current_state[i+1]) |
                                (current_state[i-1] & ~current_state[i] & ~current_state[i+1]) |
                                (~current_state[i-1] & current_state[i] & ~current_state[i+1]) |
                                (~current_state[i-1] & current_state[i] & current_state[i+1]);
            end
        end
    end

    // Assign the current state to q
    assign q = current_state;

endmodule