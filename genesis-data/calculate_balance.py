import json
import sys

def wei_to_eth(wei_balance):
    return wei_balance / 1e18

def calculate_total_balance(file_path):
    try:
        with open(file_path, 'r') as file:
            genesis_data = json.load(file)

        total_balance_wei = 0

        if 'alloc' in genesis_data:
            for account, details in genesis_data['alloc'].items():
                if 'balance' in details:
                    balance_wei = int(details['balance'], 16)  
                    if balance_wei > 0:
                        print(f"Account: {account}, Balance: {details['balance']} (wei), {wei_to_eth(balance_wei)} ETH")
                    total_balance_wei += balance_wei

        total_balance_eth = wei_to_eth(total_balance_wei)
        return total_balance_eth

    except Exception as e:
        print(f"Error reading file: {e}")
        return None

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <path_to_genesis.json>")
        sys.exit(1)

    file_path = sys.argv[1]
    total_eth = calculate_total_balance(file_path)

    if total_eth is not None:
        print(f"Total Balance: {total_eth} ETH")
    else:
        print("Failed to calculate total balance.")
