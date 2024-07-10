import os
import subprocess
import re

import languagemodels as lm
import conversation as cv
import regex as reg

import sys
import getopt

def find_verilog_modules(markdown_string, module_name='top_module'):

    module_pattern1 = r'\bmodule\b\s+\w+\s*\([^)]*\)\s*;.*?endmodule\b'

    module_pattern2 = r'\bmodule\b\s+\w+\s*#\s*\([^)]*\)\s*\([^)]*\)\s*;.*?endmodule\b'

    module_matches1 = re.findall(module_pattern1, markdown_string, re.DOTALL)

    module_matches2 = re.findall(module_pattern2, markdown_string, re.DOTALL)

    module_matches = module_matches1 + module_matches2

    if not module_matches:
        return []

    return module_matches

#def find_verilog_modules(markdown_string,module_name='top_module'):
#    print(markdown_string)
#    # This pattern captures module definitions
#    module_pattern = r'\bmodule\b\s+\w+\s*\(.*?\)\s*;.*?endmodule\b'
#    # Find all the matched module blocks
#    module_matches = re.findall(module_pattern, markdown_string, re.DOTALL)
#    # If no module blocks found, return an empty list
#    if not module_matches:
#        return []
#    return module_matches

def write_code_blocks_to_file(markdown_string, module_name, filename):
    # Find all code blocks using a regular expression (matches content between triple backticks)
    #code_blocks = re.findall(r'```(?:\w*\n)?(.*?)```', markdown_string, re.DOTALL)
    code_match = find_verilog_modules(markdown_string, module_name)

    if not code_match:
        print("No code blocks found in response")
        exit(3)

    #print("----------------------")
    #print(code_match)
    #print("----------------------")
    # Open the specified file to write the code blocks
    with open(filename, 'w') as file:
        for code_block in code_match:
            file.write(code_block)
            file.write('\n')



# creates the verilog modules using specific LLM model
def generate_verilog(conv, model_type, model_id=""):
    if model_type == "ChatGPT4":
        model = lm.ChatGPT4()
    elif model_type == "Claude":
        model = lm.Claude()
    elif model_type == "ChatGPT3p5":
        model = lm.ChatGPT3p5()
    elif model_type == "PaLM":
        model = lm.PaLM()
    elif model_type == "CodeLLama":
        model = lm.CodeLlama(model_id)
    else:
        sys.exit(2)

    return(model.generate(conv))

def verilog_loop(design_prompt, module, testbench, model_type, outdir="", log=None):

    if outdir != "":
        outdir = outdir + "/"

    conv = cv.Conversation(log_file=log)

    #conv.add_message("system", "You are a Verilog engineering tool. Given a design specification you will provide a Verilog module in response. Given errors in that design you will provide a completed fixed module. Only complete functional models should be given. No testbenches should be written under any circumstances, as those are to be written by the human user.")
    conv.add_message("system", "You are an autocomplete engine for Verilog code. \
            Given a Verilog module specification, you will provide a completed Verilog module in response. \
            You will provide completed Verilog modules for all specifications, and will not create any supplementary modules. \
            Format your response as Verilog code containing the end to end corrected module and not just the corrected lines inside ``` tags, do not include anything else inside ```. \
    ")

    #with open(testbench, 'r') as file: testbench_text = file.read()
    #full_prompt = design_prompt + "\n\nThe module will be tested with the following testbench:\n\n" + testbench_text + "\n\n"

    conv.add_message("user", design_prompt)

    #success = False
    #timeout = False

    iterations = 0
    success = 0

    filename = os.path.join(outdir,module+".v")

    status = ""
    
    while (iterations < 5):
        # Generate a response
        response = generate_verilog(conv, model_type)
        
        conv.add_message("assistant", response)

        write_code_blocks_to_file(response, module, filename)
        
        #proc = subprocess.run(["iverilog", "-o", os.path.join(outdir,module), filename, testbench],capture_output=True,text=True)
        if run_icarus_verilog(module):
            success += 1       

################################
        with open(os.path.join(outdir,"log_iter_"+str(iterations)+".txt"), 'w') as file:
            file.write('\n'.join(str(i) for i in conv.get_messages()))
            file.write('\n\n Iteration status: ' + status + '\n')

        iterations += 1

def read_modules_list(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    # Extract module names from the content
    module_names = re.findall(r'\b\w+\b(?=\()', content)
    return [f'{name}.v' for name in module_names]

def run_icarus_verilog(module_name):
    base_path = os.path.join('Modules', module_name)
    module_file_path = os.path.join(base_path, f'{module_name}.txt')
    verilog_code_path = os.path.join(base_path, f'{module_name}_llm.v')
    testbench_path = os.path.join(base_path, f'{module_name}_tb.v')
    output_executable = os.path.join(base_path, f'{module_name}_sim')

    if not os.path.exists(module_file_path):
        print(f"Error: {module_file_path} does not exist.")
        return

    if not os.path.exists(verilog_code_path):
        print(f"Error: {verilog_code_path} does not exist.")
        return

    if not os.path.exists(testbench_path):
        print(f"Error: {testbench_path} does not exist.")
        return

    # Read module names from the module_name.txt and construct paths
    module_files = read_modules_list(module_file_path)
    module_paths = [os.path.join(base_path, module_file) for module_file in module_files]

    # Check if all module files exist
    for module_path in module_paths:
        if not os.path.exists(module_path):
            print(f"Error: {module_path} does not exist.")
            return

    # Include the top module and testbench in the module paths
    module_paths.append(verilog_code_path)
    module_paths.append(testbench_path)

    # Run Icarus Verilog to compile the Verilog files
    compile_command = ['iverilog', '-o', output_executable] + module_paths

    try:
        subprocess.run(compile_command, check=True)
        print(f"Compilation successful. Executable created at {output_executable}")
    except subprocess.CalledProcessError as e:
        print(f"Error during compilation: {e}")
        return False

    # Run the simulation
    try:
        subprocess.run([output_executable], check=True)
        print("Simulation completed successfully.")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error during simulation: {e}")
        return False

def main():
    module_name = os.environ['module_name']  # Set the folder name to 'RCA' or replace with desired module name
    run_icarus_verilog(module_name)

    usage = "Usage: auto_create_verilog.py [--help] --prompt=<prompt> --name=<module name> --testbench=<testbench file> --iter=<iterations> --model=<llm model> --model_id=<model id> --log=<log file>\n\n\t-h|--help: Prints this usage message\n\n\t-p|--prompt: The initial design prompt for the Verilog module\n\n\t-n|--name: The module name, must match the testbench expected module name\n\n\t-t|--testbench: The testbench file to be run\n\n\t-i|--iter: [Optional] Number of iterations before the tool quits (defaults to 10)\n\n\t-m|--model: The LLM to use for this generation. Must be one of the following\n\t\t- ChatGPT3p5\n\t\t- ChatGPT4\n\t\t- Claude\n\n\t- CodeLLama\n\n\t-l|--log: [Optional] Log the output of the model to the given file"

    try:
        opts, args = getopt.getopt(sys.argv[1:], "hp:n:t:i:m:l", ["help", "prompt=", "name=", "testbench=", "iter=", "model=", "model_id=","log="])
    except getopt.GetoptError as err:
        print(err)
        print(usage)
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print(usage)
            sys.exit()
        elif opt in ("-p", "--prompt"):
            prompt = arg
        elif opt in ("-n", "--name"):
            module = arg
        elif opt in ("-t", "--testbench"):
            testbench = arg
        elif opt in ("-i", "--iter"):
            max_iterations = int(arg)
        elif opt in ("-m", "--model"):
            model = arg
        elif opt in ("-id", "--model_id"):
            model = arg
        elif opt in ("-o", "--outdir"):
            outdir = arg
        elif opt in ("-l", "--log"):
            log = arg


    # Check if prompt and module are set
    try:
        prompt
    except NameError:
        print("Prompt not set")
        print(usage)
        sys.exit(2)

    try:
        module
    except NameError:
        print("Module not set")
        print(usage)
        sys.exit(2)

    try:
        testbench
    except NameError:
        print("Testbench not set")
        print(usage)
        sys.exit(2)

    try:
        model
    except NameError:
        print("LLM not set")
        print(usage)
        sys.exit(2)

    try:
        outdir
    except NameError:
        outdir = ""

    if outdir != "":
        if not os.path.exists(outdir):
            os.makedirs(outdir)

    verilog_loop(prompt, module, testbench, max_iterations, model, outdir, log)


if __name__ == "__main__":
    main()
