module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 

    // Heater is on when in heating mode and too_cold is true, otherwise it's off
    assign heater = mode & too_cold;
    
    // Air conditioner is on when in cooling mode and too_hot is true, otherwise it's off
    assign aircon = ~mode & too_hot;

    // Fan is on when either heater or air conditioner is on, or when fan_on is true
    assign fan = (heater | aircon) | fan_on;
    
endmodule