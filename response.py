#!/usr/bin/env python3

import os
import sys
import getopt
from collections import Counter
import languagemodels as lm
import conversation as cv
import regex as reg  # Assumes this contains the extract_verilog_code function

def generate_response(system_prompt, design_prompt, model_type, prompt_strategy=None):
    """
    Generates a response from the language model based on the design prompt.
    
    Parameters:
    system_prompt (str): Custom system prompt to use.
    design_prompt (str): The prompt to input into the LLM.
    model_type (str): The type of LLM to use.
    prompt_strategy (str): The strategy for the system prompt.
    
    Returns:
    str: The generated response from the LLM.
    """
    conv = cv.Conversation()

    # Set system prompt based on the strategy
    if system_prompt:
        conv.add_message("system", system_prompt)
    else:
        conv.add_message("system", get_sys_prompt(prompt_strategy))
    
    conv.add_message("user", design_prompt)

    # Generate the response
    response = generate_verilog(conv, model_type)

    return response

def get_sys_prompt(prompt_strategy=None):
    framework_name = os.environ.get('framework_name', 'default_framework')
    sys_prompt_file = os.path.join(framework_name, 'sys_prompt.txt')
    
    if os.path.isfile(sys_prompt_file):
        with open(sys_prompt_file, 'r') as file:
            return file.read()
    else:
        if prompt_strategy == 'Self-ask':
            return (
                "You are an advanced assistant for designing Verilog modules. "
                "You will first ask clarifying questions to ensure the specification is clear and complete. "
                "After getting answers to your questions, you will generate the complete Verilog module. "
                "Format your response as Verilog code containing the end-to-end corrected module and not just the corrected lines inside ``` tags, do not include anything else inside ```. "
            )
        else:
            return (
                "You are an autocomplete engine for Verilog code. "
                "Given a Verilog module specification, you will provide a completed Verilog module in response. "
                "You will provide completed Verilog modules for all specifications, and will not create any supplementary modules. "
                "Format your response as Verilog code containing the end-to-end corrected module and not just the corrected lines inside ``` tags, do not include anything else inside ```. "
            )

def generate_verilog(conv, model_type, model_id=""):
    if model_type == "ChatGPT4":
        model = lm.ChatGPT4()
    elif model_type == "Claude":
        model = lm.Claude()
    elif model_type == "ChatGPT3p5":
        model = lm.ChatGPT3p5()
    elif model_type == "ChatGPT4o":
        model = lm.ChatGPT4o()
    elif model_type == "PaLM":
        model = lm.PaLM()
    elif model_type == "CodeLlama":
        model = lm.CodeLlama(model_id)
    else:
        sys.exit(2)

    return model.generate(conv)

def get_most_consistent_response(responses):
    """
    Selects the most consistent response from a list of responses.

    Parameters:
    responses (list): A list of responses from the language model.

    Returns:
    str: The most consistent response.
    """
    response_counts = Counter(responses)
    most_common_response = response_counts.most_common(1)[0][0]
    return most_common_response

def get_response(design_prompt, module, model_type, outdir="", log=None, prompt_strategy=None, dirname="responses"):
    if outdir:
        outdir += "/"

    conv = cv.Conversation()

    conv.add_message("system", get_sys_prompt(prompt_strategy))
    conv.add_message("user", design_prompt)

    # Generate the directory path
    dir_path = os.path.join(outdir, prompt_strategy, dirname)

    # Create the directory if it doesn't exist
    os.makedirs(dir_path, exist_ok=True)

    # Generate the filename within the new directory
    filename = os.path.join(dir_path, f"{module}.txt")

    if prompt_strategy == 'Self-consistency':
        responses = []
        for i in range(10): 
            response = generate_verilog(conv, model_type)
            responses.append(reg.extract_verilog_code(response))
        
        # Select the most consistent response
        final_response = get_most_consistent_response(responses)
    elif prompt_strategy == 'Self-ask':
        final_response = handle_self_ask(conv, model_type)
    else:
        final_response = generate_verilog(conv, model_type)

    with open(filename, 'w') as file:
        file.write(final_response)

    print(f"Response written to {filename}")
    return final_response

def handle_self_ask(conv, model_type):
    """
    Handles the 'Self-ask' prompt strategy by engaging in a multi-turn conversation with the LLM.

    Parameters:
    conv (cv.Conversation): The conversation object.
    model_type (str): The type of LLM to use.

    Returns:
    str: The final response after self-asking.
    """
    clarifying_question_prompt = (
        "What clarifying questions would you ask to improve the specification of this Verilog module?"
    )
    
    # Ask for clarifying questions
    conv.add_message("user", clarifying_question_prompt)
    questions_response = generate_verilog(conv, model_type)
    clarifying_questions = extract_questions_from_response(questions_response)
    
    # User answers the questions
    for question in clarifying_questions:
        user_answer = input(f"Please answer the question: {question}\n")
        conv.add_message("user", user_answer)
    
    # Finalize the Verilog module based on the clarifications
    final_response = generate_verilog(conv, model_type)
    
    return final_response

def extract_questions_from_response(response):
    """
    Extracts questions from the language model's response.

    Parameters:
    response (str): The response from the language model.

    Returns:
    list: A list of questions extracted from the response.
    """
    questions = []
    for line in response.split('\n'):
        if line.strip().endswith('?'):
            questions.append(line.strip())
    return questions

def main():
    usage = ("Usage: response.py [--help] --prompt=<prompt> --name=<module name> --testbench=<testbench file> --model=<llm model> --model_id=<model id> --technique=<technique>\n\n"
             "\t-h|--help: Prints this usage message\n"
             "\t-p|--prompt: The initial design prompt for the Verilog module\n"
             "\t-n|--name: The module name, must match the testbench expected module name\n"
             "\t-t|--testbench: The testbench file to be run\n"
             "\t-i|--iter: [Optional] Number of iterations before the tool quits (defaults to 10)\n"
             "\t-m|--model: The LLM to use for this generation. Must be one of the following\n"
             "\t\t- ChatGPT3p5\n"
             "\t\t- ChatGPT4\n"
             "\t\t- ChatGPT4o\n"
             "\t\t- Claude\n"
             "\t\t- PaLM\n"
             "\t\t- CodeLlama\n"
             "\t-l|--log: [Optional] Log the output of the model to the given file")

    try:
        opts, args = getopt.getopt(sys.argv[1:], "hp:n:t:i:m:l", ["help", "prompt=", "name=", "testbench=", "model=", "model_id=", "technique=", "outdir="])
    except getopt.GetoptError as err:
        print(err)
        print(usage)
        sys.exit(2)

    prompt = None
    module = None
    testbench = None
    model = None
    model_id = ""
    outdir = ""
    log = None
    prompt_strategy = os.environ.get('framework_name', 'default_framework')

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
        elif opt in ("--model_id"):
            model_id = arg
        elif opt in ("-o", "--outdir"):
            outdir = arg
        elif opt in ("--technique"):
            os.environ['framework_name'] = arg  # Set environment variable based on input
            prompt_strategy = arg

    if not (prompt and module and testbench and model):
        print("Missing required argument(s).")
        print(usage)
        sys.exit(2)

    if outdir and not os.path.exists(outdir):
        os.makedirs(outdir)

    if log:
        logfile = os.path.join(outdir, log)
    else:
        logfile = None

    get_response(prompt, module, model, outdir, logfile, prompt_strategy)

if __name__ == "__main__":
    main()
