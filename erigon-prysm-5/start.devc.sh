
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=168.119.5.82

export EL_BOOTNODES="enode://9bc6ebd67307d55efbb7745772d4499381b272d5031995c57437ff3be300130cb319bc0185c63da0f34439cf53a12320d6f56ea635dca9ee0d673a264f0d25fe@88.99.94.109:30303"

export CL_STATICPEERS="/ip4/88.99.94.109/tcp/9000/p2p/16Uiu2HAmNA3a2oSXUTBrZ6oFRnFRwFrCEML6iv8jtFPomZhr4n1T"
export CL_BOOTNODES="enr:-Ma4QJ5k2dp2t2DaNuO1AKz5cxCFfenfhnGeuRSaOAZdijtzP_MBr7PahajRbnCrgR1M6T-dBCwFUSWqgEX2lHCG5s-CARSHYXR0bmV0c4j__________4RldGgykG6JYLVAAAAB__________-CaWSCdjSCaXCEWGNebYRxdWljgiMpiXNlY3AyNTZrMaEDjSqqk5siVMhoIjlYhFSU_-a_-TT7cO6zuFReMZli7vaIc3luY25ldHMPg3RjcIIjKIN1ZHCCIyg"
export CL_CHECKPOINT=http://88.99.94.109:5052/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


