import json
import yaml
import glob

# Directory containing the JSON files
json_dir_path = './'

# Use glob to find the file with the pattern 'deposit_data-*.json'
json_files = glob.glob(json_dir_path + 'deposit_data-*.json')

if not json_files:
    print("No JSON file found with the pattern 'deposit_data-*.json'")
else:
    # Assuming you want to process the first file found
    json_file_path = json_files[0]

    # Path to the YAML file to be generated
    yaml_file_path = './validator_keys/validator_definitions.yml'

    # Read the JSON file
    with open(json_file_path, 'r') as file:
        data = json.load(file)

    # Prepare the data for the YAML file
    yaml_data = []
    for entry in data:
        pubkey = entry['pubkey']
        yaml_entry = {
            'enabled': True,
            'voting_public_key': f'0x{pubkey}',
            'type': 'web3signer',
            'url': 'https://127.0.0.1:49000',
            'root_certificate_path': None,
            'request_timeout_ms': None,
            'client_identity_path': None,
            'client_identity_password': None
        }
        yaml_data.append(yaml_entry)

    # Write to the YAML file
    with open(yaml_file_path, 'w') as file:
        # Write the initial line
        file.write('---\n')

        # Dump the YAML data with proper indentation
        yaml.dump(yaml_data, file, default_flow_style=False, indent=2, sort_keys=False)

        # Add a blank line at the end
        file.write('\n')

    print(f'YAML file {yaml_file_path} has been created based on {json_file_path}.')
