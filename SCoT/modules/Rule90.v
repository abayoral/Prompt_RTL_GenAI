module top_module (
    input wire clk,
    input wire load,
    input wire [511:0] data,
    output reg [511:0] q
);

    // Register to hold current state of the automaton
    reg [511:0] current_state;

    // Register to hold next state of the automaton
    reg [511:0] next_state;

    integer i;

    // Always block to handle state initialization and updates
    always @(posedge clk) begin
        if (load) begin
            // Initialize current state with input data
            current_state <= data;
        end else begin
            // Compute next state based on Rule 90
            for (i = 0; i < 512; i = i + 1) begin
                if (i == 0) begin
                    // Handle boundary condition for first cell
                    next_state[i] <= current_state[1] ^ 1'b0;
                end else if (i == 511) begin
                    // Handle boundary condition for last cell
                    next_state[i] <= current_state[510] ^ 1'b0;
                end else begin
                    // General case for cells in the middle
                    next_state[i] <= current_state[i-1] ^ current_state[i+1];
                end
            end
            // Update current state to the next state
            current_state <= next_state;
        end
    end

    // Assign current state to the output q
    always @(current_state) begin
        q <= current_state;
    end

endmodule