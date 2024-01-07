
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=168.119.5.82
export EL_BOOTNODES="enode://8147fa1e8168978fde7c578e510624cfe7e00c0ef476a2a9496d0918266093cff3078bd8539c2cf26bde53de9c147b86f5ad39a80150f103e053a497f314954f@78.46.91.61:30503"

export CL_BOOTNODES="enr:-MK4QBvFpn1o27HbLcyN8Wy3B1C4aREWTf63oIdLFyEisWpBNuIhPe1CMKfbtLG2jZSYVyl4Ky_tpLtu_iOx2oHb5uWGAYzj59jRh2F0dG5ldHOIAMAAAAAAAACEZXRoMpBngW9pUAAAAf__________gmlkgnY0gmlwhKh3BVKJc2VjcDI1NmsxoQNDVBeRC8tKYWxeYpEiC78wRB1c1FwCZDN_P6tM9jejuohzeW5jbmV0cwCDdGNwgjMsg3VkcIIvRA"
export CL_STATICPEERS="/ip4/168.119.5.82/tcp/13100/p2p/16Uiu2HAmHBp39Uhk1WEiFsYk4Ag5AUSVdVPfDLpq8uiAEdDPKdx5"
export CL_CHECKPOINT=http://78.46.91.61:4510/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


