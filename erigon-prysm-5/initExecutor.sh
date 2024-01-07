

docker run \
  --rm \
  -it \
  --user=root \
  -v $(pwd)/execution-data:/execution-data \
  -v $(pwd)/config-example:/config \
  -v $(pwd)/el-cl-genesis-data:/el-cl-genesis-data \
  thorax/erigon:stable \
  init \
  --datadir=/execution-data \
  /el-cl-genesis-data/custom_config_data/genesis.json

