import json
import os
import sys

def extract_pubkeys(input_file_path):
    # Extract the base name of the input file for the directory name
    base_name = os.path.splitext(os.path.basename(input_file_path))[0]
    output_dir = f'{base_name}_pubkeys'
    os.makedirs(output_dir, exist_ok=True)

    # Load data from the input JSON file
    with open(input_file_path, 'r') as file:
        data = json.load(file)

    # Extract pubkeys and prepend '0x'
    pubkeys = ['0x' + entry['pubkey'] for entry in data]

    # Fixed output file name within the new directory
    output_file_path = os.path.join(output_dir, 'pubkeys.json')

    # Write the pubkeys to the output file
    with open(output_file_path, 'w') as file:
        json.dump(pubkeys, file)

    print(f'Pubkeys saved to {output_file_path}')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python a.py <file_path>")
        sys.exit(1)  # Exit if the number of arguments is incorrect

    input_file_path = sys.argv[1]
    if not os.path.exists(input_file_path):
        print(f"The file {input_file_path} does not exist.")
        sys.exit(1)

    extract_pubkeys(input_file_path)
