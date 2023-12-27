
sudo rm -rvf el-cl-genesis-data

docker run \
  -it \
  -v $(pwd)/el-cl-genesis-data:/data \
  -v $(pwd)/config-example:/config \
  --rm \
  lyfsn/ethereum-genesis-generator:2.0.4 all










