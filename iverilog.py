import os
import subprocess
import re

def run_icarus_verilog(module_name, framework_name, testbench_file):
    base_path = os.path.join(framework_name, 'modules')
    module_file_path = os.path.join(base_path, f'{module_name}.v')
    testbench_path = testbench_file
    simulations_dir = os.path.join(framework_name, 'simulations')
    output_executable = os.path.join(simulations_dir, f'{module_name}_sim')

    print(f"Module file path: {module_file_path}")
    print(f"Testbench file path: {testbench_path}")

    if not os.path.exists(module_file_path):
        print(f"Error: {module_file_path} does not exist.")
        return

    if not os.path.exists(testbench_path):
        print(f"Error: {testbench_path} does not exist.")
        return

    # Ensure the simulations directory exists
    os.makedirs(simulations_dir, exist_ok=True)

    # Run Icarus Verilog to compile the Verilog files
    compile_command = ['iverilog', '-o', output_executable, module_file_path, testbench_path]

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
    framework_name = os.environ.get('framework_name')  # Default if not provided
    module_name = os.environ.get('module_name')  # Default if not provided
    testbench_file = os.environ.get('testbench')

    if not testbench_file:
        print("Error: 'testbench' environment variable is not set.")
        return

    run_icarus_verilog(module_name, framework_name, testbench_file)

if __name__ == "__main__":
    main()
