module top_module (
    input x,   // First input signal
    input y,   // Second input signal
    output z   // Output signal that is defined by the expression z = (x ^ y) & x
);

assign z = (x ^ y) & x;

endmodule