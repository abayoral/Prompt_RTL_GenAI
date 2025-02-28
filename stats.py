import subprocess
import os
import glob
import sys

def check_test_results(file_path, is_rtllm):
    with open(file_path, 'r') as file:
        content = file.readlines()

    if is_rtllm:
        if len(content) == 0:
            return False, 0, 100
        
        if any("error" in line.lower() for line in content):
            return False, 0, 100
        
        simulation_successful = any("Your Design Passed" in line for line in content)

        test_summary_line = next((line for line in content if "Test Summary" in line), None)
        if test_summary_line:
            try:
                total_tests = int([line for line in content if "Total Tests Run:" in line][0].split()[-1])
                errors = int([line for line in content if "Total Failures:" in line][0].split()[-1])
            except (IndexError, ValueError):
                total_tests = 100
                errors = sum(int(line.split()[4]) for line in content if "Test completed with" in line and line.split()[4].isdigit())
        else:
            total_tests = 100
            errors = sum(int(line.split()[4]) for line in content if "Test completed with" in line and line.split()[4].isdigit())

        if errors == 0 and total_tests == 100:
            errors = 0  

        passed_tests = total_tests - errors
        return simulation_successful, passed_tests, total_tests

    else:
        if len(content) == 0:
            return False, 0, 100  

        if any("error" in line.lower() for line in content):
            return False, 0, 100
        
        simulation_successful = any("Simulation completed successfully." in line for line in content)
        passed_tests = sum(1 for line in content if "passed!" in line)
        total_tests = sum(1 for line in content if line.startswith("Test"))

        return simulation_successful, passed_tests, total_tests if simulation_successful else (False, 0, total_tests)


if len(sys.argv) != 3:
    print("Usage: python script_name.py <framework_name> <model_name>")
    sys.exit(1)

framework_name = sys.argv[1]
model_name = sys.argv[2]

os.environ['framework_name'] = framework_name
os.environ['model_name'] = model_name

framework_directory = os.path.join(os.getcwd(), framework_name, model_name)
os.makedirs(framework_directory, exist_ok=True)

succ_counter = {}
pass_k_counter = {}  # Track pass@k success

if framework_name == "RaR":
    script_path = os.path.join(framework_directory, "rar.py")
elif framework_name == "RoEm":
    script_path = os.path.join(framework_directory, "roem.py")
else:
    script_path = None

#prompt_directories = ["Sequential & FSMs", "Basic-Combinational", "Arithmetic & Data", "Modular & Advanced"]
prompt_directories = ["Modular & Advanced"]; 

for prompt_dir in prompt_directories:
    prompts_dir = os.path.join(framework_directory, prompt_dir)
    stats_dir = os.path.join(prompts_dir, 'stats')
    os.makedirs(stats_dir, exist_ok=True)

    succ_counter = {}  
    pass_k_counter = {}  

    for i in range(5):
        if script_path:
            print(f"Executing {script_path} for framework {framework_name}, prompts in '{prompt_dir}' (iteration {i + 1})...")
            try:
                subprocess.run(['python', script_path, prompts_dir], check=True)
                print(f"Execution of {script_path} completed successfully.")
            except subprocess.CalledProcessError as e:
                print(f"Error executing {script_path}: {e}")
                continue
        subprocess.run(['python', 'main.py', framework_name, prompt_dir], check=True)
        stats_files = glob.glob(os.path.join(stats_dir, '*.txt'))

        for stats_file in stats_files:
            stats_file_name = os.path.splitext(os.path.basename(stats_file))[0]

            if stats_file_name.startswith("RTLLM_"):
                clean_stats_file_name = stats_file_name[6:]
            else:
                clean_stats_file_name = stats_file_name
            

            is_rtllm = "RTLLM_" in stats_file_name

            if stats_file_name not in succ_counter:
                succ_counter[stats_file_name] = [0, 0, 0, []]  # Success count, total passed, total tests, success ratios
                pass_k_counter[stats_file_name] = [False] * 5  # Track success per iteration

            results = check_test_results(stats_file, is_rtllm)

            if results[0]:  # If the test passed in this iteration
                pass_k_counter[stats_file_name][i] = True  # Mark this iteration as successful
                succ_counter[stats_file_name][0] += 1  

            succ_counter[stats_file_name][1] += results[1]  
            succ_counter[stats_file_name][2] += results[2]  
            succ_counter[stats_file_name][3].append(results[1] / results[2] if results[2] != 0 else 0)

            with open(stats_file, "w") as s_file:
                s_file.truncate(0)  # Clear the log file after execution

            responses_file = os.path.join(framework_directory, "responses", f"{clean_stats_file_name}.v")
            modules_file = os.path.join(framework_directory, "modules", f"{clean_stats_file_name}.v")

             # Clear the corresponding .v files if they exist
            for file_path in [responses_file, modules_file]:
                if os.path.exists(file_path):
                    with open(file_path, "w") as f:
                        f.truncate(0)
            

            

    metrics_dir = os.path.join(framework_directory, 'metrics')
    os.makedirs(metrics_dir, exist_ok=True)
    metrics_file_path = os.path.join(metrics_dir, f'metrics_{prompt_dir.replace(" ", "_")}.txt')

    with open(metrics_file_path, 'w') as metrics_file:
        name_width = 17
        success_width = 13
        ratio_width = 24
        total_success_width = 10
        overall_success_width = 7
        pass_k_width = 12

        header = (f"{'Name'.ljust(name_width)} | {'Overall Success'.ljust(success_width)} | "
                  f"{'Success Ratio Iteration 1'.ljust(ratio_width)} | "
                  f"{'Success Ratio Iteration 2'.ljust(ratio_width)} | "
                  f"{'Success Ratio Iteration 3'.ljust(ratio_width)} | "
                  f"{'Success Ratio Iteration 4'.ljust(ratio_width)} | "
                  f"{'Success Ratio Iteration 5'.ljust(ratio_width)} | "
                  f"{'Total Success'.ljust(total_success_width)} | "
                  f"{'Sum of Ratios'.ljust(overall_success_width)} | "
                  f"{'Pass@1'.ljust(pass_k_width)} | {'Pass@2'.ljust(pass_k_width)} | "
                  f"{'Pass@3'.ljust(pass_k_width)} | {'Pass@4'.ljust(pass_k_width)} | "
                  f"{'Pass@5'.ljust(pass_k_width)}\n")

        metrics_file.write(header)

        for key, value in succ_counter.items():
            total_success = f"{value[0]}/5".ljust(success_width)
            success_ratios = ' | '.join(f"{ratio:24.2f}" for ratio in value[3])
            overall_success_ratio = value[1] / value[2] if value[2] != 0 else 0.0
            sum_of_ratios = sum(value[3])

            # Compute pass@k values correctly
            pass_k_results = [1 if any(pass_k_counter[key][:k + 1]) else 0 for k in range(5)]
            pass_k_values = ' | '.join(f"{pass_k_results[k]:12d}" for k in range(5))

            metrics_file.write(f"{key.ljust(name_width)} | {total_success} | {success_ratios} | "
                               f"{overall_success_ratio:24.2f} | {sum_of_ratios:7.2f} | {pass_k_values}\n")

    print(f"Metrics saved to {metrics_file_path}")