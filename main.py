import os
import subprocess
import glob
import sys

# to execute from command line: python main.py <name of framework> <name of prompt_dir>

# Ensure the script is called with exactly two arguments
if len(sys.argv) != 3:
    print("Usage: python script_name.py <framework_name> <prompt_dir>")
    sys.exit(1)

# Get the framework name and prompt directory from the command line arguments
framework_name = sys.argv[1]
prompt_dir = sys.argv[2]

# Set the environment variable
os.environ['framework_name'] = framework_name
print(f"framework_name environment variable set to: {os.environ['framework_name']}")

prompts_dir = os.path.join(framework_name, prompt_dir)
testbench_dir = 'hdlbits_testbenches'

# Create a directory for logs within the prompt directory
stats_dir = os.path.join(prompts_dir, 'stats')
os.makedirs(stats_dir, exist_ok=True)
print(f"Logs will be stored in: {stats_dir}")

# Get all .v files in the prompts directory
v_files = glob.glob(os.path.join(prompts_dir, '*.v'))

# Add directories starting with "RTLLM_"
rtllm_dirs = [d for d in os.listdir(prompts_dir) if os.path.isdir(os.path.join(prompts_dir, d)) and d.startswith("RTLLM_")]

# Define the commands template
commands_template = [
    ['./response.py', '--prompt={prompt}', '--name={name}', '--testbench={testbench}', '--model=ChatGPT4o'],
    ['python', 'regex.py'],
    ['python', 'iverilog.py']
]

# Store the original directory
original_dir = os.getcwd()

# Execute the commands for each RTLLM_ directory
for rtllm_dir in rtllm_dirs:
    rtllm_path = os.path.join(prompts_dir, rtllm_dir)
    module_name = rtllm_dir.replace("RTLLM_", "")
    prompt_file = os.path.join(rtllm_path, "design_description.txt")

    # Ensure the prompt file exists
    if not os.path.exists(prompt_file):
        print(f"Prompt file {prompt_file} does not exist. Skipping {rtllm_dir}.")
        continue

    # Set environment variables for the current iteration
    os.environ['module_name'] = module_name
    print(f"module_name environment variable set to: {os.environ['module_name']}")

    # Execute response.py for RTLLM_ files
    response_command = ['./response.py', '--prompt={}'.format(prompt_file), '--name={}'.format(module_name), '--model=ChatGPT4o']
    try:
        subprocess.run(response_command, check=True)
        print(f"Response command executed successfully for {rtllm_dir}.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing response command for {rtllm_dir}: {e}")
        continue

    # Execute regex.py for RTLLM_ files
    regex_command = ['python', 'regex.py']
    try:
        subprocess.run(regex_command, check=True)
        print(f"Regex command executed successfully for {rtllm_dir}.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing regex command for {rtllm_dir}: {e}")
        continue

    # Change directory to the RTLLM_ directory to run make commands
    os.chdir(rtllm_path)

    # Execute make commands: compile, sim, clean
    make_commands = ["make compile", "make sim", "make clean"]
    
    stat_file_path = os.path.join(original_dir,stats_dir, f"RTLLM_{module_name}.txt")
    if not os.path.exists(os.path.dirname(stat_file_path)):
        os.makedirs(os.path.dirname(stat_file_path), exist_ok=True)
    
    with open(stat_file_path, "w") as statfile:
        for make_command in make_commands:
            try:
                if make_command == "make sim":  # Only save the output of the simulation step
                    result = subprocess.run(make_command, shell=True, check=True, stdout=statfile, stderr=statfile)
                else:
                    result = subprocess.run(make_command, shell=True, check=True)
                print(f"Command '{make_command}' executed successfully in {rtllm_path}.")
            except subprocess.CalledProcessError as e:
                print(f"Error executing command '{make_command}' in {rtllm_path}: {e}")
                break

    # Change back to the original directory
    os.chdir(original_dir)

    # Print a new line after each iteration
    print("\n\n\n\n")

# Execute the commands for each .v file
for v_file in v_files:
    # Extract the base name (without extension) to use as the module name
    base_name = os.path.basename(v_file).replace('.v', '')
    testbench_file = os.path.join(testbench_dir, f'{base_name.capitalize()}_0_tb.v')

    # Ensure the testbench file exists
    if not os.path.exists(testbench_file):
        print(f"Testbench file {testbench_file} does not exist. Skipping {v_file}.")
        continue

    # Set environment variables for the current iteration
    os.environ['testbench'] = testbench_file
    print(f"testbench environment variable set to: {os.environ['testbench']}")
    os.environ['module_name'] = base_name
    print(f"module_name environment variable set to: {os.environ['module_name']}")

    # Generate commands for the current .v file
    commands = [
        [part.format(prompt=v_file, name=base_name, testbench=testbench_file) for part in command]
        for command in commands_template
    ]
    
    # Store the stat file path
    stat_file_path = os.path.join(stats_dir, f"{base_name}.txt")
    
    # Execute each command in sequence
    for command in commands:
        try:
            if 'iverilog.py' in command[1]:  # Check if the command is running the testbench
                with open(stat_file_path, "w") as statfile:
                    result = subprocess.run(command, check=True, stdout=statfile, stderr=statfile)
            else:
                result = subprocess.run(command, check=True)
            print(f"Command {' '.join(command)} executed successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Error executing command {' '.join(command)}: {e}")
            break

    # Print a new line after each iteration
    print("\n\n\n\n")
