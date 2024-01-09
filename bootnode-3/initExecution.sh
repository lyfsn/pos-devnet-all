

docker run \
  --rm \
  -it \
  -v $(pwd)/execution-data:/execution-data \
  -v $(pwd)/el-cl-genesis-data:/el-cl-genesis-data \
  ghcr.io/paradigmxyz/reth \
  init \
  --datadir=/execution-data \
  --chain=/el-cl-genesis-data/custom_config_data/genesis.json \

