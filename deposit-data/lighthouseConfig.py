import json
import yaml
import os
import sys

def process_json_file(json_file_path):
    # Extract the base name of the file without extension for the directory name
    base_name = os.path.splitext(os.path.basename(json_file_path))[0]
    output_dir = f'./{base_name}_lighthouse'
    os.makedirs(output_dir, exist_ok=True)

    # Read the JSON file
    with open(json_file_path, 'r') as file:
        data = json.load(file)

    # Split size
    split_size = 4096

    # Split data and write to multiple YAML files
    for i in range(0, len(data), split_size):
        yaml_data = []
        for entry in data[i:i+split_size]:
            pubkey = entry['pubkey']
            yaml_entry = {
                'enabled': True,
                'voting_public_key': f'0x{pubkey}',
                'type': 'web3signer',
                'url': 'https://web3signer1.archivenode.club',
                'root_certificate_path': None,
                'request_timeout_ms': None,
                'client_identity_path': None,
                'client_identity_password': None
            }
            yaml_data.append(yaml_entry)

        yaml_file_path = os.path.join(output_dir, f'validator_definitions_{i//split_size + 1}.yml')
        with open(yaml_file_path, 'w') as file:
            file.write('---\n')
            yaml.dump(yaml_data, file, default_flow_style=False, indent=2, sort_keys=False)
            file.write('\n')

        print(f'YAML file {yaml_file_path} has been created.')

    print(f'All YAML files have been created based on {json_file_path}.')

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_json_file>")
        sys.exit(1)

    json_file_path = sys.argv[1]
    if not os.path.exists(json_file_path):
        print(f"The file {json_file_path} does not exist.")
        sys.exit(1)

    process_json_file(json_file_path)
