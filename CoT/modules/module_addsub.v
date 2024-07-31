module top_module(
        input [31:0] a,
        input [31:0] b,
        input sub,
        output [31:0] sum
    );
        wire[15:0] sum1, sum2;
        wire carry1, carry2;
        wire[31:0] b_complement;

        // Compute the complement of b when sub is 1
        assign {b_complement[31:16], b_complement[15:0]} = b ^ {(sub?32'hFFFFFFFF:32'h00000000)};

        // Instantiate the first 16-bit adder
        add16 adder1(
            .a(a[15:0]),
            .b(b_complement[15:0]),
            .cin(sub),
            .sum(sum1),
            .cout(carry1)
        );

        // Instantiate the second 16-bit adder
        add16 adder2(
            .a(a[31:16]),
            .b(b_complement[31:16]),
            .cin(carry1),
            .sum(sum2),
            .cout(carry2)
        );

        // Concatenate the outputs of the two adders to form the final result
        assign sum = {carry2, sum2, sum1};
    endmodule