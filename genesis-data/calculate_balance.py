import json
import sys

def wei_to_eth(wei_balance):
    # Convert wei to ETH
    return wei_balance / 10**18

def calculate_total_balance(file_path):
    try:
        # Load the JSON file
        with open(file_path, 'r') as file:
            genesis_data = json.load(file)

        # Initialize total balance
        total_balance_wei = 0

        # List of accounts to ignore
        ignore_accounts = {
             "0x8943545177806ED17B9F23F0a21ee5948eCaa776",
            "0xE25583099BA105D9ec0A67f5Ae86D90e50036425",
            "0x614561D2d143621E126e87831AEF287678B442b8",
            "0xf93Ee4Cf8c6c40b329b0c0626F28333c132CF241",
            "0x802dCbE1B1A97554B4F50DB5119E37E8e7336417",
            "0xAe95d8DA9244C37CaC0a3e16BA966a8e852Bb6D6",
            "0x2c57d1CFC6d5f8E4182a56b4cf75421472eBAEa4",
            "0x741bFE4802cE1C4b5b00F9Df2F5f179A1C89171A",
            "0xc3913d4D8bAb4914328651C2EAE817C8b78E1f4c",
            "0x65D08a056c17Ae13370565B04cF77D2AfA1cB9FA",
            "0x3e95dFbBaF6B348396E6674C7871546dCC568e56",
            "0x5918b2e647464d4743601a865753e64C8059Dc4F",
            "0x589A698b7b7dA0Bec545177D3963A2741105C7C9",
            "0x4d1CB4eB7969f8806E2CaAc0cbbB71f88C8ec413",
            "0xF5504cE2BcC52614F121aff9b93b2001d92715CA",
            "0xF61E98E7D47aB884C244E39E031978E33162ff4b",
            "0xf1424826861ffbbD25405F5145B5E50d0F1bFc90",
            "0xfDCe42116f541fc8f7b0776e2B30832bD5621C85",
            "0xD9211042f35968820A3407ac3d80C725f8F75c14",
            "0xD8F3183DEF51A987222D845be228e0Bbb932C222",
            "0xafF0CA253b97e54440965855cec0A8a2E2399896",
            "0x9A272Cae8733610AFe71A9CBd8F027A9d1EcdE65",
            "0x2F4E3f802d80ffF3a8a34977E97b27306146FCB4",
            "0xb0F6A252b488C4DbFC6D0b27b1E5e9dD7bF4b0BD",
            "0x7a7Ce40A01FDa4EB0768a6bdbc9C221BA337B785",
            "0x10bAb832d0016F16Fb87fcc0133a8ae7226E80Fe",
            "0xd5dC7da514Bd461c362a3F0aA09F1fcc4046B4C2",
            "0x3B446D3692e6d60105335dbb3045600aF2e1Fbc0",
            "0x8d9700C52251feFb8Ff6aCd492199DB089857109",
            "0xD6Ff384b64115f8064ff86CDF82C7ECc0C2564Ab",
            "0xEe7BA75D46D3ce18727BB079F89105e35e49f363",
            "0x2544A636094Dd50379314510fF27ad210Cae8aF4",
            "0xca680b2d9DFCF0a515d9718681Ae0719e12B8395"
        }

        # Iterate and sum the balances of all accounts
        if 'alloc' in genesis_data:
            for account, details in genesis_data['alloc'].items():
                if account not in ignore_accounts and 'balance' in details:
                    balance_wei = int(details['balance'], 16)  # Convert hex to integer
                    if balance_wei > 0:
                        print(f"Account: {account}, Balance: {details['balance']} (wei), {wei_to_eth(balance_wei):.18f} ETH")
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
        print(f"Total Balance: {total_eth:.18f} ETH")
    else:
        print("Failed to calculate total balance.")
