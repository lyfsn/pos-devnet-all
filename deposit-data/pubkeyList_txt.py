import json
import os
import sys

def extract_and_format_pubkeys(input_file_path):
    with open(input_file_path, 'r') as file:
        data = json.load(file)

    pubkeys = ['0x' + entry['pubkey'] for entry in data]

    pubkeys_string = ','.join(pubkeys)

    output_file_path = os.path.splitext(input_file_path)[0] + '_pubkeys.txt'

    with open(output_file_path, 'w') as file:
        file.write(pubkeys_string)

    print(f'Formatted pubkeys saved to {output_file_path}')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python a.py <file_path>")
    else:
        input_file_path = sys.argv[1]
        extract_and_format_pubkeys(input_file_path)
