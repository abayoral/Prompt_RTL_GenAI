#!/usr/bin/env python3

import os
import subprocess
import re
import languagemodels as lm
import conversation as cv
import regex as reg
import sys
import getopt
from time import time

# function to get the system prompt according to the prompt strategy (need to modify according to the different prompts)
def get_sys_prompt(prompt_strategy=None):
    return "You are an autocomplete engine for Verilog code. \
            Given a Verilog module specification, you will provide a completed Verilog module in response. \
            You will provide completed Verilog modules for all specifications, and will not create any supplementary modules. \
            Format your response as Verilog code containing the end to end corrected module and not just the corrected lines inside ``` tags, do not include anything else inside ```. \
    "

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

def get_response(design_prompt, module, model_type, outdir="", log=None, prompt_strategy=None, dirname="responses"):
    if outdir != "":
        outdir = outdir + "/"

    conv = cv.Conversation()

    conv.add_message("system", get_sys_prompt(prompt_strategy))
    conv.add_message("user", design_prompt)

    # Generate the directory path
    dir_path = os.path.join(outdir, dirname)

    # Create the directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    # Generate the filename within the new directory
    filename = os.path.join(dir_path, module + ".txt")

    response = generate_verilog(conv, model_type)

    with open(filename, 'w') as file:
        file.write(response)

    print(f"Response written to {filename}")

def main():
    #module_name = os.environ.get('module_name', 'RCA')  # Set the folder name to 'RCA' or replace with desired module name

    usage = "Usage: response.py [--help] --prompt=<prompt> --name=<module name> --testbench=<testbench file> --model=<llm model> --model_id=<model id> --technique=<technqiue>\n\n\t-h|--help: Prints this usage message\n\n\t-p|--prompt: The initial design prompt for the Verilog module\n\n\t-n|--name: The module name, must match the testbench expected module name\n\n\t-t|--testbench: The testbench file to be run\n\n\t-i|--iter: [Optional] Number of iterations before the tool quits (defaults to 10)\n\n\t-m|--model: The LLM to use for this generation. Must be one of the following\n\t\t- ChatGPT3p5\n\t\t- ChatGPT4\n\t\t- Claude\n\n\t- CodeLLama\n\n\t-l|--log: [Optional] Log the output of the model to the given file"

    try:
        opts, args = getopt.getopt(sys.argv[1:], "hp:n:t:i:m:l", ["help", "prompt=", "name=", "testbench=", "model=", "model_id=", "technique="])
    except getopt.GetoptError as err:
        print(err)
        print(usage)
        sys.exit(2)

    prompt = None
    module = None
    testbench = None
    model = None
    model_id = ""
    num_candidates = 1
    outdir = ""
    log = None
    prompt_strategy = None

    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print(usage)
            sys.exit()
        elif opt in ("-p", "--prompt"):
            if os.path.isfile(arg):
                with open(arg, 'r') as file:
                    prompt = file.read()
            else:
                prompt = arg
        elif opt in ("-n", "--name"):
            module = arg
        elif opt in ("-t", "--testbench"):
            testbench = arg
        elif opt in ("-m", "--model"):
            model = arg
        elif opt in ("--model-id"):
            model_id = arg
        elif opt in ("--num-candidates"):
            num_candidates = int(arg)
        elif opt in ("-o", "--outdir"):
            outdir = arg
        elif opt in ("--technique"):
            prompt_strategy = arg

    if prompt is None:
        print("Prompt not set")
        print(usage)
        sys.exit(2)

    if module is None:
        print("Module not set")
        print(usage)
        sys.exit(2)

    if testbench is None:
        print("Testbench not set")
        print(usage)
        sys.exit(2)

    if model is None:
        print("LLM not set")
        print(usage)
        sys.exit(2)

    if outdir != "":
        if not os.path.exists(outdir):
            os.makedirs(outdir)

    if log is not None:
        logfile = os.path.join(outdir, log)
    else:
        logfile = None

    get_response(prompt, module, model, outdir, logfile, prompt_strategy)

if __name__ == "__main__":
    main()
