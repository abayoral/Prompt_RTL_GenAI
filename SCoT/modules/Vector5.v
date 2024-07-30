module top_module(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    input wire e,
    output wire [24:0] out
);

    // Pairwise comparison using XNOR to check for equality
    assign out = {
        a ~^ a, a ~^ b, a ~^ c, a ~^ d, a ~^ e, // (a with others)
        b ~^ a, b ~^ b, b ~^ c, b ~^ d, b ~^ e, // (b with others)
        c ~^ a, c ~^ b, c ~^ c, c ~^ d, c ~^ e, // (c with others)
        d ~^ a, d ~^ b, d ~^ c, d ~^ d, d ~^ e, // (d with others)
        e ~^ a, e ~^ b, e ~^ c, e ~^ d, e ~^ e  // (e with others)
    };

endmodule