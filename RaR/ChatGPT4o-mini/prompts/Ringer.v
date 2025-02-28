Imagine you are tasked with designing a circuit that manages a cellphone's ringer and vibration motor. The core functionality of this circuit revolves around responding to an incoming call signal (represented by the input `ring`). Depending on whether the phone's vibrate mode is activated (input `vibrate_mode`), your circuit must either activate the ringer (output `ringer = 1`) or the vibration motor (output `motor = 1`), but critically, not both simultaneously.

In more specific terms:
- When the input signal `ring` indicates an incoming call and the input `vibrate_mode` is active (`vibrate_mode = 1`), the circuit should ensure the vibration motor is turned on (`motor = 1`).
- Conversely, if the `ring` signal is active and `vibrate_mode` is not active (`vibrate_mode = 0`), the circuit should turn on the ringer (`ringer = 1`).

Your implementation should rely solely on assign statements, effectively translating this problem into a network of logic gates. In tackling this task, you may find it easier to adopt a "backwards" approach; that is, to think in terms of the desired outputs first, and then determine the conditions for those outputs based on the inputs. This approach contrasts with the typical sequential programming methodology, where one starts with the inputs and determines the outputs.

For the purpose of this specific problem:
- Consider framing your thought process around the conditions under which the motor should be on, expressed logically.
- Similarly, think about the circumstances that should lead to the ringer being active.

Here is a template module in Verilog that you need to complete, adhering to the described logic:

```verilog
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Activate the sound ringer
    output motor         // Activate the vibration motor
);

    // Insert your code here

endmodule
```

Ensure your logic accounts for the explicit requirement that either the ringer or motor can be active at any one time, based solely on the given input conditions.