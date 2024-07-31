module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    // Heating logic: heater is on when mode is heating and it's too cold
    assign heater = mode & too_cold;

    // Cooling logic: aircon is on when mode is cooling and it's too hot
    assign aircon = ~mode & too_hot;
    
    // Fan logic: fan is on when heater or aircon is on, or if fan is explicitly requested
    assign fan = fan_on | heater | aircon;

endmodule