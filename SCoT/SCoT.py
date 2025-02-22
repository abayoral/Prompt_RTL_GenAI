import os
import sys

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Append the main folder to the system path
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir))
sys.path.append(main_folder_path)

# Now you can import the function
from response import generate_response

def main(prompt_dir):
    os.environ['prompt_dir'] = prompt_dir

    if not os.path.exists(prompt_dir):
        print(f"Error: {prompt_dir} does not exist.")
        return
    
    model_type = "ChatGPT4o"
    prompt_dir_orig = prompt_dir + "_original"
    
    generate_knowledge_path = os.path.join(current_dir, 'Exemplars_CoT.txt')
    
    with open(generate_knowledge_path, 'r') as f:
        system_prompt = f.read()
    
    # Process each prompt file in prompt_dir
    for file in os.listdir(prompt_dir_orig):
        file_path_read = os.path.join(prompt_dir_orig, file)
        file_path_write = os.path.join(prompt_dir, file)
        
        if os.path.isfile(file_path_read):
            with open(file_path_read, 'r') as f:
                user_prompt = f.read()
            
            response = generate_response(system_prompt, user_prompt, model_type)
            
            with open(file_path_write, 'w') as f:
                f.write(response)
            
            print(f"Processed and saved response for {file}")
    
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
                
                expanded_prompt = generate_response(
                    "Rephrase and expand the following question, but do not provide any solutions or answers. Focus solely on clarifying and elaborating the question itself.",
                    initial_prompt, model_type
                ).strip()
                
                with open(design_desc_path_write, 'w') as f:
                    f.write(expanded_prompt)
                
                print(f"Updated {design_desc_path_write} with expanded prompt.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python scot.py <prompt_dir>")
        sys.exit(1)
    
    prompt_dir = sys.argv[1]
    main(prompt_dir)
