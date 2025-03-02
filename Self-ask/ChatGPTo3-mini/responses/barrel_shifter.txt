module mux2X1(
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule

module barrel_shifter(
    input  wire [7:0] in,
    input  wire [2:0] ctrl,
    output wire [7:0] out
);

    // Intermediate wires for each stage.
    wire [7:0] stage4;  // Stage that shifts by 4 positions (controlled by ctrl[2])
    wire [7:0] stage2;  // Stage that shifts by 2 positions (controlled by ctrl[1])
    wire [7:0] stage1;  // Stage that shifts by 1 position  (controlled by ctrl[0])

    genvar i;

    // Stage 1: Rotate left by 4 positions when ctrl[2] is asserted.
    // For each bit position i, if ctrl[2] is 1, output stage4[i] = in[(i+4) mod 8],
    // else stage4[i] = in[i].
    generate
        for (i = 0; i < 8; i = i + 1) begin : stage4_loop
            if (i < 4) begin : index_positive
                // For i = 0,1,2,3: (i+4) is less than 8.
                mux2X1 mux_inst (
                    .a(in[i]),
                    .b(in[i+4]),
                    .sel(ctrl[2]),
                    .y(stage4[i])
                );
            end else begin : index_wrap
                // For i = 4,5,6,7: (i+4) would be >= 8; wrap-around by subtracting 8.
                // (i+4) mod 8 = i-4.
                mux2X1 mux_inst (
                    .a(in[i]),
                    .b(in[i-4]),
                    .sel(ctrl[2]),
                    .y(stage4[i])
                );
            end
        end
    endgenerate

    // Stage 2: Rotate left by 2 positions when ctrl[1] is asserted.
    // For each bit position i, if ctrl[1] is 1, output stage2[i] = stage4[(i+2) mod 8],
    // else stage2[i] = stage4[i].
    generate
        for (i = 0; i < 8; i = i + 1) begin : stage2_loop
            if (i < 6) begin : index_positive
                // For i = 0...5, (i+2) < 8.
                mux2X1 mux_inst (
                    .a(stage4[i]),
                    .b(stage4[i+2]),
                    .sel(ctrl[1]),
                    .y(stage2[i])
                );
            end else begin : index_wrap
                // For i = 6,7, wrap-around: (6+2)=8 -> 0; (7+2)=9 -> 1.
                mux2X1 mux_inst (
                    .a(stage4[i]),
                    .b(stage4[i-6]),  // because i-6 gives: 6->0, 7->1.
                    .sel(ctrl[1]),
                    .y(stage2[i])
                );
            end
        end
    endgenerate

    // Stage 3: Rotate left by 1 position when ctrl[0] is asserted.
    // For each bit position i, if ctrl[0] is 1, output stage1[i] = stage2[(i+1) mod 8],
    // else stage1[i] = stage2[i].
    generate
        for (i = 0; i < 8; i = i + 1) begin : stage1_loop
            if (i < 7) begin : index_positive
                // For i = 0...6, (i+1) < 8.
                mux2X1 mux_inst (
                    .a(stage2[i]),
                    .b(stage2[i+1]),
                    .sel(ctrl[0]),
                    .y(stage1[i])
                );
            end else begin : index_wrap
                // For i = 7, (7+1) mod8 = 0.
                mux2X1 mux_inst (
                    .a(stage2[i]),
                    .b(stage2[0]),
                    .sel(ctrl[0]),
                    .y(stage1[i])
                );
            end
        end
    endgenerate

    // Final output assignment.
    assign out = stage1;

endmodule