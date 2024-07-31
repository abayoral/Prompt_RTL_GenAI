module top_module (
    input wire in,
    input wire [1:0] state,
    output reg [1:0] next_state,
    output reg out
);

    // Define state parameters
    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;
    
    // State transition logic
    always @(*) begin
        case (state)
            A: begin
                if (in == 1'b0)
                    next_state = A;
                else
                    next_state = B;
            end
            
            B: begin
                if (in == 1'b0)
                    next_state = C;
                else
                    next_state = B;
            end
            
            C: begin
                if (in == 1'b0)
                    next_state = A;
                else
                    next_state = D;
            end
            
            D: begin
                if (in == 1'b0)
                    next_state = C;
                else
                    next_state = B;
            end
            
            default: begin
                next_state = A;
            end
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            A, B, C: out = 1'b0;
            D: out = 1'b1;
            default: out = 1'b0;
        endcase
    end

endmodule