module top_module (
    input wire [2:0] vec,    // 3-bit input vector
    output wire [2:0] outv,  // 3-bit output vector
    output wire o0,          // Individual bit output (least significant bit)
    output wire o1,          // Individual bit output (middle bit)
    output wire o2           // Individual bit output (most significant bit)
);
    // Output assignment
    assign outv = vec;
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];

endmodule