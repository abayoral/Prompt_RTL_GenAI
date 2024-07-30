module top_module (
    input wire clk,
    input wire areset,
    input wire [7:0] d,
    output reg [7:0] q
);
    // Always block sensitive to asynchronous reset and positive edge of the clock
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            q <= 8'b0; // When areset is high, set q to zero
        end
        else begin
            q <= d; // On positive edge of clk, set q to d
        end
    end
endmodule