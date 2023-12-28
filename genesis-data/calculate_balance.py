import json
import sys

def calculate_total_balance(file_path):
    try:
        with open(file_path, 'r') as file:
            genesis_data = json.load(file)

        total_balance = 0

        if 'alloc' in genesis_data:
            for account, details in genesis_data['alloc'].items():
                if 'balance' in details:
                    total_balance += int(details['balance'], 16) 

        return total_balance

    except Exception as e:
        print(f"Error reading file: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_genesis.json>")
        sys.exit(1)

    file_path = sys.argv[1]
    total = calculate_total_balance(file_path)

    if total is not None:
        print(f"Total Balance: {total}")
    else:
        print("Failed to calculate total balance.")
