`timescale 1ns / 1ps

module instr_reg_tb;

reg clk;
reg rst;
reg [1:0] fetch;
reg [7:0] data;

wire [2:0] ins;
wire [4:0] ad1;
wire [7:0] ad2;

instr_reg uut (
    .clk(clk),
    .rst(rst),
    .fetch(fetch),
    .data(data),
    .ins(ins),
    .ad1(ad1),
    .ad2(ad2)
);

integer error = 0;
integer total_tests = 0; // Counter for total test cases
integer expected_ins;
integer expected_ad1;
integer expected_ad2;

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    fetch = 2'b00;
    data = 8'h00;
    error = 0;

    // Wait 100 ns for initialization
    #100;

    // De-assert reset
    rst = 1;
    #10;

    // Perform fetch operation 1 from register
    total_tests = total_tests + 1;
    fetch = 2'b01;
    #5;
    data = 8'b01011100;
    expected_ins = 3'b010;
    expected_ad1 = 5'b11100;
    expected_ad2 = 8'b00;
    #20;

    // Check the values
    if (ins !== expected_ins) begin
        error = error + 1; 
        $display("Failed at fetch operation 1: clk=%d, ins=%b (expected %b)", clk, ins, expected_ins);
    end

    if (ad1 !== expected_ad1) begin
        error = error + 1; 
        $display("Failed at fetch operation 1: clk=%d, ad1=%b (expected %b)", clk, ad1, expected_ad1);
    end

    if (ad2 !== expected_ad2) begin
        error = error + 1; 
        $display("Failed at fetch operation 1: clk=%d, ad2=%b (expected %b)", clk, ad2, expected_ad2);
    end

    // Additional test cases can be added here, with total_tests incremented

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
