

mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=88.99.94.109
export EL_BOOTNODES="enode://9bc6ebd67307d55efbb7745772d4499381b272d5031995c57437ff3be300130cb319bc0185c63da0f34439cf53a12320d6f56ea635dca9ee0d673a264f0d25fe@88.99.94.109:30303"
export CL_BOOTNODES="enr:-MS4QHkPsxDZxve-pT0Wf_wNUWIGeR2XL5J1NlIxsOP7KgyvTRK1SxwG2OGKFst2ujn7iJmL8qE0zuBG-uFRh-YcSP4Bh2F0dG5ldHOIAAAAAAAAAACEZXRoMpBuiWC1QAAAAf__________gmlkgnY0gmlwhFhjXm2EcXVpY4IjKYlzZWNwMjU2azGhA40qqpObIlTIaCI5WIRUlP_mv_k0-3Dus7hUXjGZYu72iHN5bmNuZXRzAIN0Y3CCIyiDdWRwgiMo"
export CL_STATICPEERS="/ip4/0.0.0.0/tcp/9000/p2p/16Uiu2HAmNA3a2oSXUTBrZ6oFRnFRwFrCEML6iv8jtFPomZhr4n1T"



docker compose -f compose.yaml up -d


