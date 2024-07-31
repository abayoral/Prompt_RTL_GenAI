import pandas as pd
import argparse
import os

def calculate_and_append_average_success(folder):
    # Construct the file path
    file_path = os.path.join(folder, 'metrics.txt')

    # Read the data into a pandas DataFrame
    df = pd.read_csv(file_path, sep='|', skipinitialspace=True)

    # Remove any leading/trailing whitespace from the column names
    df.columns = df.columns.str.strip()

    # Extract the success ratio columns
    success_ratios = df.filter(like='Success Ratio Iteration')

    # Calculate the average success ratio across all iterations
    average_success_ratio = success_ratios.mean(axis=1).mean()

    # Convert to percentage
    average_success_percentage = average_success_ratio * 100

    # Save the result to the original file
    with open(file_path, 'a') as file:
        file.write(f"\nAverage Success Ratio as Percentage: {average_success_percentage:.2f}%\n")

    print(f"The average success ratio as a percentage has been added to the file: {average_success_percentage:.2f}%")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description='Calculate and append average success ratio.')
    parser.add_argument('folder', type=str, help='The folder containing the metrics.txt file')
    
    # Parse the arguments
    args = parser.parse_args()

    # Run the function with the provided folder
    calculate_and_append_average_success(args.folder)
