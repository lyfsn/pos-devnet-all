import json
import yaml
import glob
import os

# Directory containing the JSON files
json_dir_path = './validator_keys/'

# Use glob to find the file with the pattern 'deposit_data-*.json'
json_files = glob.glob(json_dir_path + 'deposit_data-*.json')

os.system('mkdir -p lighthouse_config')

if not json_files:
    print("No JSON file found with the pattern 'deposit_data-*.json'")
else:
    # Assuming you want to process the first file found
    json_file_path = json_files[0]

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

        yaml_file_path = f'./lighthouse_config/validator_definitions_{i//split_size + 1}.yml'
        with open(yaml_file_path, 'w') as file:
            file.write('---\n')
            yaml.dump(yaml_data, file, default_flow_style=False, indent=2, sort_keys=False)
            file.write('\n')

        print(f'YAML file {yaml_file_path} has been created.')

    print(f'All YAML files have been created based on {json_file_path}.')
