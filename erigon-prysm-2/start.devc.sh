
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=168.119.5.82



export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


