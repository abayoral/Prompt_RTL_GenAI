module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q
);

    wire [3:0] digit_ones, digit_tens, digit_hundreds, digit_thousands;
    wire ena_ones, ena_tens, ena_hundreds;
    
	// Ones place counter
    bcd_counter ones (
        .clk(clk),
        .reset(reset),
        .enable(1'b1),
        .q(digit_ones),
        .carry_out(ena_ones)
    );
    
	// Tens place counter
    bcd_counter tens (
        .clk(clk),
        .reset(reset),
        .enable(ena_ones),
        .q(digit_tens),
        .carry_out(ena_tens)
    );
    
	// Hundreds place counter
    bcd_counter hundreds (
        .clk(clk),
        .reset(reset),
        .enable(ena_tens),
        .q(digit_hundreds),
        .carry_out(ena_hundreds)
    );
    
	// Thousands place counter
    bcd_counter thousands (
        .clk(clk),
        .reset(reset),
        .enable(ena_hundreds),
        .q(digit_thousands)
    );

    assign ena[1] = ena_ones;
    assign ena[2] = ena_tens;
    assign ena[3] = ena_hundreds;
    
    assign q = {digit_thousands, digit_hundreds, digit_tens, digit_ones};

endmodule