
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=78.46.91.61 
export EL_BOOTNODES="enode://8147fa1e8168978fde7c578e510624cfe7e00c0ef476a2a9496d0918266093cff3078bd8539c2cf26bde53de9c147b86f5ad39a80150f103e053a497f314954f@78.46.91.61:30503"

export CL_BOOTNODES="enr:-MK4QCJrppfK-MTHGmYr_0Uj6RCAilgYiR9SfH8zGque9nZVEcy7N4t0DpGqkQF-QedsqJL5h5fY9bjHtnuWeILPCFWGAYzizaJSh2F0dG5ldHOIAAAAAAAAAAyEZXRoMpBuiWC1UAAAAf__________gmlkgnY0gmlwhE4uWz2Jc2VjcDI1NmsxoQOkAJMboi-jgpIXOWRalPhS7D5zdFKVDcorJicCgSlig4hzeW5jbmV0cwCDdGNwgjMsg3VkcIIvRA"
export CL_STATICPEERS="/ip4/172.21.0.4/tcp/13100/p2p/16Uiu2HAmPhBindDaKKor97KddDQ68dbdG15fkKERs1GnVcLiSAcz"
export CL_CHECKPOINT=http://88.99.94.109:5509/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


