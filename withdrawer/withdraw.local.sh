


export KEYFILE="keystore-m_12381_3600_64_0_0-1703236578.json"

docker run \
  --rm \
  -it \
  -v $(pwd)/consensus-data:/consensus-data \
  -v $(pwd)/el-cl-genesis-data:/el-cl-genesis-data \
  -v $(pwd)/${KEYFILE}:/${KEYFILE} \
  sigp/lighthouse:latest \
  lighthouse \
  --datadir=/consensus-data \
  --testnet-dir=/el-cl-genesis-data/custom_config_data \
  account validator exit \
  --keystore /${KEYFILE} \
  --beacon-node http://host.docker.internal:5052


