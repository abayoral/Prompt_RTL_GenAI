
import os
import sys
import getopt
from time import time

import glob

# Get the directory of the current script
current_dir = os.path.dirname(os.path.abspath(__file__))

# Append the main folder to the system path
main_folder_path = os.path.abspath(os.path.join(current_dir, os.pardir))
sys.path.append(main_folder_path)


def main():

    framework_name = "Self-ask"
    os.environ['framework_name'] = framework_name

    # Now you can import the function
    import response as res


    prompts_dir = os.path.join(current_dir, 'prompts')
    

    # Get all .v files in the prompts directory
    v_files = glob.glob(os.path.join(prompts_dir, '*.v'))

    model_type = "ChatGPT4"

    for v_file in v_files:
        # Extract the base name (without extension) to use as the module name
        base_name = os.path.basename(v_file).replace('.v', '')

        #read the intial prompt
        with open(v_file, 'r') as file:
            initial_prompt = file.read()

        #add the question at the end of the intial prompt
        
        prompt_withq = initial_prompt + '//Do you require any additional information on how to implement the module? Respond with only "Yes" or "No"/n'

        
         # Step 1: Get initial response
        initial_response = res.generate_response("You are an autocomplete engine for Verilog code",prompt_withq, model_type).strip().lower()
        print(initial_response)
        
        if initial_response == "yes":
            # Step 2: Ask for additional information
            additional_info_prompt = initial_prompt + "Please specify any additional information you require regarding the implementation of the module."
            additional_info_response = res.generate_response("You are an autocomplete engine for Verilog code", additional_info_prompt, model_type).strip()
            print("Additional Information Required: ", additional_info_response)
            # Step 3: Get additional information from the user
            additional_info = input("Please provide the additional information: ")
            if additional_info == "pass":
                continue
            with open(v_file, 'a') as file:
                file.write("\n" + additional_info)

if __name__ == "__main__":
  main()
