
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=127.0.0.1
export EL_BOOTNODES=""
export CL_BOOTNODES=""
export CL_STATICPEERS=""
export CL_CHECKPOINT=""

export SIGNER_URL="http://host.docker.internal:49000"
export PUBKEY_FILE="deposit_data-1703767932_2_pubkeys.json"



docker compose -f compose.yaml up -d



