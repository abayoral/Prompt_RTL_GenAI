import subprocess
import os
import glob
import sys

def check_test_results(file_path):
    with open(file_path, 'r') as file:
        content = file.readlines()

    # Check for simulation completion
    simulation_successful = any("Simulation completed successfully." in line for line in content)
    
    # Count the number of tests passed
    passed_tests = sum(1 for line in content if "passed!" in line)
    
    # Count the total number of tests
    total_tests = sum(1 for line in content if line.startswith("Test"))

    if not simulation_successful:
        return False, 0, total_tests

    if passed_tests == total_tests:
        return True, passed_tests, total_tests
    else:
        return False, passed_tests, total_tests

# Ensure the script is called with exactly one argument
if len(sys.argv) != 2:
    print("Usage: python script_name.py <framework_name>")
    sys.exit(1)

# Get the framework name from the command line arguments
framework_name = sys.argv[1]

succ_counter = {}
os.environ['framework_name'] = framework_name

# Define the directory paths based on framework_name
if framework_name == "Self-ask":
    framework_directory = os.path.join(os.getcwd(), "Self-ask")
    script_path = os.path.join(framework_directory, "self-ask.py")
    print(f"Executing self-ask.py for framework {framework_name}...")
    try:
        subprocess.run(['python', script_path], check=True)
        print(f"Execution of {script_path} completed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error executing {script_path}: {e}")
    # Update prompts and stats directory for Self-ask framework
    prompts_dir = os.path.join(framework_directory, 'prompts')
    stats_dir = os.path.join(framework_directory, 'stats')
else:
    # For other frameworks, use the framework_name directly
    prompts_dir = os.path.join(framework_name, 'prompts')
    stats_dir = os.path.join(framework_name, 'stats')

# Perform iterations
for i in range(5):
    subprocess.run(['python', 'main.py', framework_name], check=True)

    # Get all log files in the stats directory
    stats_files = glob.glob(os.path.join(stats_dir, '*.txt'))

    # Iterate through each log file and check the test results
    for stats_file in stats_files:
        stats_file_name = os.path.splitext(os.path.basename(stats_file))[0]

        # Initialize the dictionary entry to 0 if it doesn't exist
        if stats_file_name not in succ_counter:
            succ_counter[stats_file_name] = [0,0,0]

        results = check_test_results(stats_file)

        if results[0]:
            succ_counter[stats_file_name][0] += 1
        
        succ_counter[stats_file_name][1] += results[1]
        succ_counter[stats_file_name][2] += results[2]
        succ_counter[stats_file_name].append(results[1]/results[2])

# Ensure the metrics directory exists
metrics_dir = framework_name
if not os.path.exists(metrics_dir):
    os.makedirs(metrics_dir)

# Write the results to metrics.txt
metrics_file_path = os.path.join(metrics_dir, 'metrics.txt')

with open(metrics_file_path, 'w') as metrics_file:
    # Writing header
    metrics_file.write(f"Name | Overall Success | Success Ratio Iteration 1 | Success Ratio Iteration 2 | Success Ratio Iteration 3 | Success Ratio Iteration 4 | Success Ratio Iteration 5 | Total success | Sum of ratios\n")
    for key, value in succ_counter.items():
        # Formatting the output for Total Success with "/5"
        total_success = f"{value[0]}/5"
        success_ratios = ' | '.join(f"{ratio:.2f}".ljust(24) for ratio in value[1:])
        overall_success_ratio = value[1] / value[2] if value[2] != 0 else 0.0  # Prevent division by zero
        sum_of_ratios = sum(value[3:])  # Calculate the sum of success ratios from value[3:]
        metrics_file.write(f"{key.ljust(17)} | {total_success.ljust(13)} | {success_ratios} | {overall_success_ratio:.2f} | {sum_of_ratios:.2f}\n")

print(f"Metrics saved to {metrics_file_path}")
