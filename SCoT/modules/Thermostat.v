module top_module (
    input wire too_cold,
    input wire too_hot,
    input wire mode,
    input wire fan_on,
    output wire heater,
    output wire aircon,
    output wire fan
);

    // Heater logic: Heater is on when mode is heating (mode = 1) and too_cold = 1
    assign heater = mode && too_cold;

    // Air conditioner logic: Aircon is on when mode is cooling (mode = 0) and too_hot = 1
    assign aircon = ~mode && too_hot;

    // Fan logic: Fan is on when either heater or aircon is on, or fan_on is high
    assign fan = heater || aircon || fan_on;

endmodule