module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum0, sum1, sum2;
    wire cout0, cout1, cout2;
    
    // Instantiate the 'add16' modules
    add16 add_inst0 (
        .a(a[15:0]), 
        .b(b[15:0]), 
        .cin(1'b0), 
        .sum(sum0), 
        .cout(cout0) 
    );

    add16 add_inst1 (
        .a(a[31:16]), 
        .b(b[31:16]), 
        .cin(cout0), 
        .sum(sum1), 
        .cout(cout1) 
    );

    add16 add_inst2 (
        .a(a[31:16]), 
        .b(b[31:16]), 
        .cin(1'b1), 
        .sum(sum2), 
        .cout(cout2) 
    );

    // Instantiate the 'mux_2to1_16bit' modules
    mux_2to1_16bit mux_inst (
        .a(sum1), 
        .b(sum2), 
        .s(cout0), 
        .y(sum[31:16]) 
    );
    
    assign sum[15:0] = sum0;

endmodule