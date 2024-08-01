module top_module(
    input clk,
    input in,
    input areset,
    output reg out); 

    // State encoding
    typedef enum reg [1:0] {
        A = 2'b00,
        B = 2'b01,
        C = 2'b10,
        D = 2'b11
    } state_t;

    state_t state, next_state;

    // State transition logic
    always @(*) begin
        case (state)
            A: next_state = (in == 1'b1) ? B : A;
            B: next_state = (in == 1'b1) ? B : C;
            C: next_state = (in == 1'b1) ? D : A;
            D: next_state = (in == 1'b1) ? B : C;
            default: next_state = A;
        endcase
    end
    
    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= A;
        else
            state <= next_state;
    end
    
    // Output logic
    always @(*) begin
        case (state)
            D: out = 1'b1;
            default: out = 1'b0;
        endcase
    end

endmodule