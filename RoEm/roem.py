import os
import sys
import glob

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Append the main folder to the system path
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir))
sys.path.append(main_folder_path)

def main():

    framework_name = "RoEm"
    os.environ['framework_name'] = framework_name

    # Now you can import the function
    import response as res

    original_prompts_dir = os.path.join(current_dir, 'original_prompts')
    new_prompts_dir = os.path.join(current_dir, 'prompts')
    if not os.path.exists(new_prompts_dir):
        os.makedirs(new_prompts_dir)  # Create the directory if it doesn't exist

    # Get all .v files in the original prompts directory
    v_files = glob.glob(os.path.join(original_prompts_dir, '*.v'))

    model_type = "ChatGPT4o"

    for v_file in v_files:
        # Extract the base name (without extension) to use as the module name
        base_name = os.path.basename(v_file).replace('.v', '')

        # Read the initial prompt
        with open(v_file, 'r') as file:
            initial_prompt = file.read()

        # Step 1: Determine the specific hardware engineer field with a specific system prompt
        hardware_engineer_prompt = (
            "Based on the following Verilog module prompt, identify the one specific type of hardware engineer best suited to develop the module. "
            "Provide only the name of the field, and do not include any additional explanation."
        )
        hardware_engineer_field = res.generate_response(hardware_engineer_prompt, initial_prompt, model_type).strip()
        print(hardware_engineer_field)

        # Step 2: Append the determined hardware engineer field at the beginning of the prompt
        modified_prompt = f"// you're a senior {hardware_engineer_field} at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.\n\n{initial_prompt}"

        # Save the modified prompt to a new file in the new prompts directory
        extended_file_path = os.path.join(new_prompts_dir, f"{base_name}.v")
        with open(extended_file_path, 'w') as file:
            file.write(modified_prompt)

if __name__ == "__main__":
    main()
