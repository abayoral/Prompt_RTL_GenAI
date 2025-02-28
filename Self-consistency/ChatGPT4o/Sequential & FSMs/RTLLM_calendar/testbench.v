`timescale 1ns/1ps
module main();

reg clk, rst;
wire [5:0] out1, out2, out3;

calendar dut (.CLK(clk), .RST(rst), .Hours(out1), .Mins(out2), .Secs(out3));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

integer outfile;
reg [17:0] clocktime;
always @(posedge clk) begin
    clocktime[17:12] <= out1;
    clocktime[11:6] <= out2;
    clocktime[5:0] <= out3;
end

reg [17:0] reference_data [0:4000];
integer i = 0;
integer error = 0;
integer total_tests = 0; // Counter for total test cases

initial begin
    #10;
    rst = 1;
    #25;
    rst = 0;
    
    // Load reference data
    $readmemh("reference.txt", reference_data);

    // Perform 4000 test iterations
    repeat (4000) begin    
        total_tests = total_tests + 1; // Increment total test count

        // Compare expected vs actual
        error = (reference_data[i] == clocktime) ? error : error + 1;
        i = i + 1;

        #10;
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

endmodule
