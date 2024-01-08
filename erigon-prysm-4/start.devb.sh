
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=78.46.91.61 

export EL_BOOTNODES="enode://8147fa1e8168978fde7c578e510624cfe7e00c0ef476a2a9496d0918266093cff3078bd8539c2cf26bde53de9c147b86f5ad39a80150f103e053a497f314954f@78.46.91.61:30503"

export CL_BOOTNODES="enr:-MK4QFJqi60LnekQZXx7surVX5sLKChG2GkG9hQjtxSHcOF3LgW_2Ubz370B2393NTeYdOO5MMdPPKDqXHj0pDhvLPWGAYznNaM9h2F0dG5ldHOIAAAAAGAAAACEZXRoMpBuiWC1UAAAAf__________gmlkgnY0gmlwhE4uWz2Jc2VjcDI1NmsxoQImn5ufUYTS7pi4EhJtJIOhtJ0_VflVFv0UDSjq_1G-W4hzeW5jbmV0cwCDdGNwgjMsg3VkcIIvRA"
export CL_STATICPEERS="/ip4/78.46.91.61/tcp/13100/p2p/16Uiu2HAkx2SdXRsVtzh6HreThaCbh1B8BdintWY92gcWz6HsWHjp"
export CL_CHECKPOINT=http://78.46.91.61:4510/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


