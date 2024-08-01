module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);

    // If vibrate_mode is on and ring is active, motor should be on.
    assign motor = ring & vibrate_mode;

    // If vibrate_mode is off and ring is active, ringer should be on.
    assign ringer = ring & ~vibrate_mode;

endmodule