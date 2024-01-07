
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=78.46.91.61 
export EL_BOOTNODES="enode://ea5cef549d9508b0f3f282ec203a64580660d1e50accf74634764090b7f131ea490dfa3cdf3baf3298273c8e233d08f11e964f7d05987e453aa6edc244a73de8@88.99.94.109:30503"

export CL_BOOTNODES="enr:-MK4QCJrppfK-MTHGmYr_0Uj6RCAilgYiR9SfH8zGque9nZVEcy7N4t0DpGqkQF-QedsqJL5h5fY9bjHtnuWeILPCFWGAYzizaJSh2F0dG5ldHOIAAAAAAAAAAyEZXRoMpBuiWC1UAAAAf__________gmlkgnY0gmlwhE4uWz2Jc2VjcDI1NmsxoQOkAJMboi-jgpIXOWRalPhS7D5zdFKVDcorJicCgSlig4hzeW5jbmV0cwCDdGNwgjMsg3VkcIIvRA"
export CL_STATICPEERS="/ip4/172.21.0.4/tcp/13100/p2p/16Uiu2HAmPhBindDaKKor97KddDQ68dbdG15fkKERs1GnVcLiSAcz"
export CL_CHECKPOINT=http://88.99.94.109:5509/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


