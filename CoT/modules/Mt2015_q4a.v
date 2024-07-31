module top_module (
    input wire x,
    input wire y,
    output wire z
);
    // Implement the function z = (x ^ y) & x
    assign z = (x ^ y) & x;
endmodule