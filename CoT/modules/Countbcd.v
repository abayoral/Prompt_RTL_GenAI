module top_module (
    input clk,
    input reset,         // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q
);
    // Intermediate enable signals for each BCD digit
    wire ena1, ena2, ena3;
    
    assign ena[1] = ena1;
    assign ena[2] = ena2;
    assign ena[3] = ena3;

    // Ones digit (q[3:0])
    always @(posedge clk) begin
        if (reset)
            q[3:0] <= 4'b0000;
        else if (q[3:0] == 4'd9)
            q[3:0] <= 4'b0000;
        else
            q[3:0] <= q[3:0] + 4'b0001;
    end

    // Tens digit (q[7:4])
    always @(posedge clk) begin
        if (reset)
            q[7:4] <= 4'b0000;
        else if (ena1 && q[7:4] == 4'd9)
            q[7:4] <= 4'b0000;
        else if (ena1)
            q[7:4] <= q[7:4] + 4'b0001;
    end

    // Hundreds digit (q[11:8])
    always @(posedge clk) begin
        if (reset)
            q[11:8] <= 4'b0000;
        else if (ena2 && q[11:8] == 4'd9)
            q[11:8] <= 4'b0000;
        else if (ena2)
            q[11:8] <= q[11:8] + 4'b0001;
    end

    // Thousands digit (q[15:12])
    always @(posedge clk) begin
        if (reset)
            q[15:12] <= 4'b0000;
        else if (ena3 && q[15:12] == 4'd9)
            q[15:12] <= 4'b0000;
        else if (ena3)
            q[15:12] <= q[15:12] + 4'b0001;
    end

    // Enable signals logic
    assign ena1 = (q[3:0] == 4'd9);
    assign ena2 = ena1 && (q[7:4] == 4'd9);
    assign ena3 = ena2 && (q[11:8] == 4'd9);

endmodule