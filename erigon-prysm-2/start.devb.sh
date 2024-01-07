
mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=78.46.91.61

export EL_BOOTNODES="enode://9bc6ebd67307d55efbb7745772d4499381b272d5031995c57437ff3be300130cb319bc0185c63da0f34439cf53a12320d6f56ea635dca9ee0d673a264f0d25fe@88.99.94.109:30303"

export CL_STATICPEERS="/ip4/0.0.0.0/tcp/9000/p2p/16Uiu2HAmNA3a2oSXUTBrZ6oFRnFRwFrCEML6iv8jtFPomZhr4n1T"
export CL_BOOTNODES="enr:-MS4QHbF6UP70USsTk5hO1g04WLBiNmf6FT77I8qIORa_WRTe2VsQIvNAiGrFIh-VNgHDf6v2H7156uLvDlglbLMdEBGh2F0dG5ldHOIAAAAAAAAAACEZXRoMpBuiWC1QAAAAf__________gmlkgnY0gmlwhFhjXm2EcXVpY4IjKYlzZWNwMjU2azGhA40qqpObIlTIaCI5WIRUlP_mv_k0-3Dus7hUXjGZYu72iHN5bmNuZXRzAIN0Y3CCIyiDdWRwgiMo"
export CL_CHECKPOINT=http://88.99.94.109:13100/

export SIGNER_URL="https://web3signer1.archivenode.club"


docker compose -f compose.yaml up -d


