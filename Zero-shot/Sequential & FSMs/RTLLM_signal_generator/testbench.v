module tb_signal_generator;
reg				clk, rst_n;
wire [4:0]		wave;

signal_generator uut (
    .clk(clk),
    .rst_n(rst_n),
    .wave(wave)
);

reg [31:0] reference [0:99];

integer i = 0;
integer error = 0;
integer total_tests = 0; // Counter for total test cases

initial begin
    $readmemh("tri_gen.txt", reference);
    clk = 0;
    rst_n = 0;
    #10;
    rst_n = 1;

    repeat(100) begin
        total_tests = total_tests + 1; // Increment test count

        error = (wave == reference[i]) ? error : error + 1;
        #10;
        i = i + 1;
    end

    // Final test result summary
    $display("=========== Test Summary ===========");
    $display("Total Tests Run: %d", total_tests);
    $display("Total Failures: %d", error);

    if (error == 0) begin
        $display("=========== Your Design Passed ===========");
    end else begin
        $display("=========== Test completed with %d / %d failures ===========", error, total_tests);
    end

    $finish;
end
 
always #5 clk = ~clk;
 
endmodule
