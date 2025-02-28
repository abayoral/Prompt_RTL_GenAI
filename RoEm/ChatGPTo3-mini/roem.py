import os
import sys
import glob

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))
print(f"Current script directory: {current_dir}")

# Go up three levels to reach the main folder (project/)
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir, os.pardir))

sys.path.append(main_folder_path)

def main(prompt_dir):
    framework_name = "RoEm"
    os.environ['framework_name'] = framework_name
    os.environ['prompt_dir'] = prompt_dir

    # Now you can import the function
    import response as res

    if not os.path.exists(prompt_dir):
        print(f"Error: {prompt_dir} does not exist.")
        return

    model_type = "ChatGPT4o"

    prompt_dir_orig = prompt_dir + "_original"

    # Process each .v file in prompt_dir
    for file in os.listdir(prompt_dir_orig):
        file_path_read = os.path.join(prompt_dir_orig, file)
        file_path_write = os.path.join(prompt_dir, file)
        
        if os.path.isfile(file_path_read) and file.endswith('.v'):
            with open(file_path_read, 'r') as f:
                initial_prompt = f.read()
            
            hardware_engineer_prompt = (
                "Based on the following Verilog module prompt, identify the one specific type of hardware engineer best suited to develop the module. "
                "Provide only the name of the field, and do not include any additional explanation."
            )
            hardware_engineer_field = res.generate_response(hardware_engineer_prompt, initial_prompt, model_type).strip()
            #print(hardware_engineer_field)
            
            modified_prompt = f"// you're a senior {hardware_engineer_field} at a leading hardware design company tasked with developing a critical Verilog module for a next-generation product. The success of this module is pivotal for maintaining my computer hardware company's reputation in the industry.\n\n{initial_prompt}"
            
            with open(file_path_write, 'w') as f:
                f.write(modified_prompt)
            
            print(f"Updated {file_path_write} with modified prompt.")
    
    # Check for RTLLM_ directories inside prompt_dir and process design_description.txt
    for subdir in os.listdir(prompt_dir_orig):
        subdir_path_read = os.path.join(prompt_dir_orig, subdir)
        subdir_path_write = os.path.join(prompt_dir, subdir)
        if os.path.isdir(subdir_path_read) and subdir.startswith("RTLLM_"):
            design_desc_path_read = os.path.join(subdir_path_read, "design_description.txt")
            design_desc_path_write = os.path.join(subdir_path_write, "design_description.txt")
            if os.path.exists(design_desc_path_read):
                with open(design_desc_path_read, 'r') as f:
                    initial_prompt = f.read()
                
                expanded_prompt = res.generate_response(
                    "Rephrase and expand the following question, but do not provide any solutions or answers. Focus solely on clarifying and elaborating the question itself.",
                    initial_prompt, model_type
                ).strip()
                
                with open(design_desc_path_write, 'w') as f:
                    f.write(expanded_prompt)
                
                print(f"Updated {design_desc_path_write} with expanded prompt.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python roem.py <prompt_dir>")
        sys.exit(1)
    
    prompt_dir = sys.argv[1]
    main(prompt_dir)
