



docker run \
  --rm \
  -it \
  -v $(pwd)/consensus-data:/consensus-data \
  -v $(pwd)/el-cl-genesis-data:/el-cl-genesis-data \
  -v $(pwd)/keystore-m_12381_3600_0_0_0-1703236543.json:/keystore-m_12381_3600_0_0_0-1703236543.json \
  sigp/lighthouse:latest \
  lighthouse \
  --datadir=/consensus-data \
  --testnet-dir=/el-cl-genesis-data/custom_config_data \
  account validator exit \
  --keystore /keystore-m_12381_3600_0_0_0-1703236543.json \
  --beacon-node http://host.docker.internal:5052






