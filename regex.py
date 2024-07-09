import os
import re

def read_generated_code(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def extract_verilog_code(text):
    verilog_pattern = r'(?s)module\s+top_module\s*\(.*?\);\s*.*?endmodule'
    matches = re.findall(verilog_pattern, text, re.DOTALL)
    return '\n\n'.join(matches).strip()

def save_extracted_code(file_path, extracted_code):
    with open(file_path, 'w') as file:
        file.write(extracted_code)

def main():
    module_name = os.environ['module_name']  # Set the folder name to 'RCA' or replace with desired module name
    base_path = os.path.join('Modules', module_name)
    generated_code_path = os.path.join(base_path, 'generated_code.txt')
    extracted_code_path = os.path.join(base_path, f'{module_name}_llm.v')

    if not os.path.exists(generated_code_path):
        print(f"Error: {generated_code_path} does not exist.")
        return

    generated_code = read_generated_code(generated_code_path)
    verilog_code = extract_verilog_code(generated_code)
    
    if verilog_code:
        save_extracted_code(extracted_code_path, verilog_code)
        print(f"Extracted Verilog code has been written to {extracted_code_path}")
    else:
        print(f"No Verilog code found in {generated_code_path}")

if __name__ == "__main__":
    main()
