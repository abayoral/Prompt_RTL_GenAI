As a senior Digital Design Engineer at a top hardware design company, you have been assigned a crucial role in the development of a Verilog module, which is integral to the success and reputation of your company’s next-generation product. The module you are tasked with designing functions as a control system for a large water reservoir that serves multiple users. The primary objective of the design is to efficiently manage the water flow to maintain an adequate water level in the reservoir.

In your design, three sensors are strategically placed in a vertical alignment at intervals of 5 inches. The sensors are identified as S_1 (the lowest), S_2 (in the middle), and S_3 (the highest). The system’s behavior is contingent upon the water level in relation to these sensors, with the ultimate goal of ensuring optimal water utilization and preventing overflows or shortages.

1. **Behavioral Specifications:**
   - When the water level exceeds the position of the highest sensor, S_3, the input flow rate must be set to zero, meaning no additional water should enter the reservoir to prevent overflow.
   - Conversely, if the water level falls below the lowest sensor, S_1, both the Nominal flow valve and the Supplemental flow valve should be fully opened to maximize water inflow, addressing the critical need for replenishment.
   - For water levels that position between any two sensors (between S_3 and S_2, or between S_2 and S_1), the flow rate is determined by the current water level coupled with the historic level before the last sensor change.
   
2. **Flow Control Logic:**
   - A predefined Nominal flow rate is associated with each sensor-identified water level (as per a provided table).
   - If the trend shows a rising water level (previous level lower than the current), the system adheres to the nominal flow rate.
   - If the trend indicates a falling water level (previous level higher than the current), the system should engage the Supplemental flow valve, invoking an increased flow rate that accounts for the difference or delta (Δ FR).

3. **Design Requirements:**
   - Your task is to design a Moore state machine model to encapsulate these water level monitoring and flow rate adjustments.
   - The FSM will include specific states representing different water levels and transitions based on sensor inputs.
   - Outputs will include FR1, FR2, FR3, and a delta flow rate (Δ FR), where each output corresponds to different control requirements, as outlined above.

4. **Reset Functionality:**
   - The module should incorporate an active-high synchronous reset feature.
   - Upon activation, the reset should return the state machine to a state reflecting an extended low water level—a scenario where no sensors are triggered, yet all flow-rate-related outputs are activated. This implies readiness to quickly address the low-level condition by opening all valves.

5. **Module Declaration:**
   - The initial framework for your Verilog module has been prepared, but requires completion. You will define how the inputs (sensor statuses) affect the state transitions and how each state dictates the outputs (flow rates). This functionality will be embedded within the top_module structure provided.

Write down the detailed Verilog code logic that incorporates these behavioral specifications, ensuring clarity and efficiency in managing the water reservoir levels to support and enhance product reliability and your company’s standing.