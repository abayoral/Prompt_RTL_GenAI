module top_module(
    input a,
    input b,
    input c,
    input d,
    output out
);

    // Using Sum of Products (SOP) form after simplifying the Karnaugh map:
    assign out = (~c & ~d & a) | (c & d & b) | (c & ~d);

endmodule