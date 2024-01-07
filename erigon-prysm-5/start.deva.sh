
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=88.99.94.109
export EL_BOOTNODES="enode://ea5cef549d9508b0f3f282ec203a64580660d1e50accf74634764090b7f131ea490dfa3cdf3baf3298273c8e233d08f11e964f7d05987e453aa6edc244a73de8@88.99.94.109:30503"
export CL_BOOTNODES="enr:-MK4QLVj7DNYlKNwOJsjuJ61b2akBS8vjLQHQYblgglfjlNfHxfNjCKq_rlN3Wcsa5cOoUoxgEcTfihamhqIHrg1ODGGAYzKOEiRh2F0dG5ldHOIAAAAAAAAAACEZXRoMpBuiWC1UAAAAf__________gmlkgnY0gmlwhFhjXm2Jc2VjcDI1NmsxoQMvvEp09OBbQIIhVYtLSd6fLJtX3Wze1ssM3YSPkiSkEIhzeW5jbmV0cwCDdGNwgjMsg3VkcIIvRA"
export CL_STATICPEERS="/ip4/172.25.0.3/tcp/13100/p2p/16Uiu2HAmFsL39RPKUtDPPHFrdjb3XL2RN5YP4c3gpvKX2ACkUjjV"
export CL_CHECKPOINT=http://88.99.94.109:5509/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


