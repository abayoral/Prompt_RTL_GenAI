import os
import sys
import glob

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Append the main folder to the system path
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir))
sys.path.append(main_folder_path)

def main():

    framework_name = "RaR"
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

        # Step 1: Ask for fundamental principles and concepts with a specific system prompt
        expanded_prompt = res.generate_response("Rephrase and expand the following question, but do not provide any solutions or answers. Focus solely on clarifying and elaborating the question itself.", initial_prompt, model_type).strip()

        # Save the extended prompt to a new file in the new prompts directory
        extended_file_path = os.path.join(new_prompts_dir, f"{base_name}.v")
        with open(extended_file_path, 'w') as file:
            file.write(expanded_prompt)

if __name__ == "__main__":
    main()
