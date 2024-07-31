# gk.py

import sys
import os

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Append the main folder to the system path
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir))
sys.path.append(main_folder_path)

# Now you can import the function
from response import generate_response

# Function to read the system prompt from a file
def read_system_prompt(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Function to read a user prompt from a file
def read_user_prompt(file_path):
    with open(file_path, 'r') as file:
        return file.read()

# Function to save the result to a file
def save_result(file_path, response, original_prompt):
    with open(file_path, 'w') as file:
        file.write(f"\n{response}\n\n")
        file.write(f"Task:\n{original_prompt}")

# Use the imported function
if __name__ == "__main__":
    # Path to the generate_knowledge.txt file
    generate_knowledge_path = os.path.join(current_dir, 'generate_knowledge.txt')
    
    # Read the system prompt from the file
    system_prompt = read_system_prompt(generate_knowledge_path)
    
    # Directory containing the prompts
    prompts_dir = os.path.join(current_dir, 'original_prompts')
    
    # Directory to save the results
    gk_prompts_dir = os.path.join(current_dir, 'prompts')
    os.makedirs(gk_prompts_dir, exist_ok=True)
    
    # Loop through each prompt file in the prompts folder
    for prompt_file in os.listdir(prompts_dir):
        prompt_file_path = os.path.join(prompts_dir, prompt_file)
        
        # Read the user prompt from the file
        user_prompt = read_user_prompt(prompt_file_path)
        
        # Define the model type and prompt strategy
        model_type = "ChatGPT4o"
        prompt_strategy = None  # or set your specific strategy if needed
        
        # Call the generate_response function
        response = generate_response(system_prompt, user_prompt, model_type, prompt_strategy)
        
        # Path to save the result
        result_file_path = os.path.join(gk_prompts_dir, prompt_file)
        
        # Save the response and original prompt to the result file
        save_result(result_file_path, response, user_prompt)
        
        print(f"Processed and saved response for {prompt_file}")
