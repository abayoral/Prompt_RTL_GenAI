import pandas as pd
import argparse
import os

def calculate_and_append_average_success(folder):
    # Iterate over all files in the folder
    for file_name in os.listdir(folder):
        file_path = os.path.join(folder, file_name)

        # Skip if it's not a file
        if not os.path.isfile(file_path):
            continue

        try:
            # Read the data into a pandas DataFrame
            df = pd.read_csv(file_path, sep='|', skipinitialspace=True)

            # Remove any leading/trailing whitespace from the column names
            df.columns = df.columns.str.strip()

            # Extract the success ratio columns
            success_ratios = df.filter(like='Success Ratio Iteration')

            if success_ratios.empty:
                print(f"No 'Success Ratio Iteration' columns found in {file_name}. Skipping.")
                continue

            # Calculate the average success ratio across all iterations
            average_success_ratio = success_ratios.mean(axis=1).mean()

            # Convert to percentage
            average_success_percentage = average_success_ratio * 100

            # Extract Pass@k columns
            pass_columns = [col for col in df.columns if col.startswith('Pass@')]

            if pass_columns:
                # Calculate the average Pass@k values for each k
                pass_averages = df[pass_columns].mean()
                pass_averages_dict = pass_averages.to_dict()
            else:
                print(f"No 'Pass@k' columns found in {file_name}. Skipping Pass@k calculations.")
                pass_averages_dict = {}

            # Save the results to the original file
            with open(file_path, 'a') as file:
                file.write(f"\nAverage Success Ratio as Percentage: {average_success_percentage:.2f}%\n")
                for k, avg_value in pass_averages_dict.items():
                    file.write(f"{k} Average: {avg_value:.2f}\n")

            print(f"Processed {file_name}: The average success ratio and Pass@k values have been added.")

        except Exception as e:
            print(f"Error processing file {file_name}: {e}")

if __name__ == "__main__":
    # Set up argument parsing
    parser = argparse.ArgumentParser(description='Calculate and append average success ratio and Pass@k values for all files in the folder.')
    parser.add_argument('folder', type=str, help='The folder containing the files to process')

    # Parse the arguments
    args = parser.parse_args()

    # Run the function with the provided folder
    calculate_and_append_average_success(args.folder)
