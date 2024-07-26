module top_module (
    input wire p1a,
    input wire p1b,
    input wire p1c,
    input wire p1d,
    input wire p2a,
    input wire p2b,
    input wire p2c,
    input wire p2d,
    output wire p1y,
    output wire p2y
);
    // Using Intermediate Signals
    wire p1and1 = p1a & p1b; // First AND gate
    wire p1and2 = p1c & p1d; // Second AND gate
    wire p2and1 = p2a & p2b; // Third AND gate
    wire p2and2 = p2c & p2d; // Fourth AND gate

    // OR gates
    assign p1y = p1and1 | p1and2;
    assign p2y = p2and1 | p2and2;

    // Alternatively, without Intermediate Signals
    // assign p1y = (p1a & p1b) | (p1c & p1d);
    // assign p2y = (p2a & p2b) | (p2c & p2d);
endmodule