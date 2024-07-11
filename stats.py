import subprocess
import os
import glob
import argparse
import sys

# to execute from command line: python stats.py <name of framework>


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
for i in range(5):
    subprocess.run(['python', 'main.py', framework_name], check=True)
    # Define the stats directory
    stats_dir = os.path.join(framework_name, 'stats')
    # Get all log files in the logs directory
    stats_files = glob.glob(os.path.join(stats_dir, '*.txt'))
    # Iterate through each log file and check the test results
    for stats_file in stats_files:
        stats_file_name = os.path.splitext(os.path.basename(stats_file))[0]
         # Initialize the dictionary entry to 0 if it doesn't exist
        if stats_file_name not in succ_counter:
            succ_counter[stats_file_name] = [0]
        results = check_test_results(stats_file)
        if results[0]:
            succ_counter[stats_file_name][0] += 1
        else:
            succ_counter[stats_file_name].append(results[1]/results[2])


for key, value in succ_counter.items():
    print(f"{key}: {value[0]}/5")
           




