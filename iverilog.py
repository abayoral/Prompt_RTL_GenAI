import os
import subprocess
import re

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
        return

    # Run the simulation
    try:
        subprocess.run([output_executable], check=True)
        print("Simulation completed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Error during simulation: {e}")

def main():
    module_name = os.environ['module_name']  # Set the folder name to 'RCA' or replace with desired module name
    run_icarus_verilog(module_name)

if __name__ == "__main__":
    main()
