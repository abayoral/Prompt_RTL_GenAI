import os
import subprocess
import glob
import sys

# to execute from command line: python main.py <name of framework>

# Ensure the script is called with exactly one argument
if len(sys.argv) != 2:
    print("Usage: python script_name.py <framework_name>")
    sys.exit(1)

# Get the framework name from the command line arguments
framework_name = sys.argv[1]

# Set the environment variable
os.environ['framework_name'] = framework_name
print(f"framework_name environment variable set to: {os.environ['framework_name']}")

prompts_dir = os.path.join(framework_name, 'prompts')
testbench_dir = 'hdlbits_testbenches'

# Create a directory for logs within the framework directory
stats_dir = os.path.join(framework_name, 'stats')
os.makedirs(stats_dir, exist_ok=True)
print(f"Logs will be stored in: {stats_dir}")

# Get all .v files in the prompts directory
v_files = glob.glob(os.path.join(prompts_dir, '*.v'))

# Define the commands template
commands_template = [
    ['./response.py', '--prompt={prompt}', '--name={name}', '--testbench={testbench}', '--model=ChatGPT4'],
    ['python', 'regex.py'],
    ['python', 'iverilog.py']
]

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

    # Execute each command in sequence
    for command in commands:
        try:
            stat_file_path = os.path.join(stats_dir, f"{base_name}.txt")
            with open(stat_file_path, "w") as statfile:
                result = subprocess.run(command, check=True, stdout=statfile, stderr=statfile)
                print(f"Command {' '.join(command)} executed successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Error executing command {' '.join(command)}: {e}")
            break

    # Print a new line after each iteration
    print("\n\n\n\n")