import json
import os
import sys

def extract_pubkeys(input_file_path):
    with open(input_file_path, 'r') as file:
        data = json.load(file)

    pubkeys = ['0x' + entry['pubkey'] for entry in data]

    output_file_path = os.path.splitext(input_file_path)[0] + '_pubkeys.json'

    with open(output_file_path, 'w') as file:
        json.dump(pubkeys, file)

    print(f'Pubkeys saved to {output_file_path}')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python a.py <file_path>")
    else:
        input_file_path = sys.argv[1]
        extract_pubkeys(input_file_path)
