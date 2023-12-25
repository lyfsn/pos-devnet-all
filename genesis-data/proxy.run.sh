
rm -rvf el-cl-genesis-data


docker run \
  -it \
  --env http_proxy=http://host.docker.internal:7890 \
  --env https_proxy=http://host.docker.internal:7890 \
  --env all_proxy=socks5://host.docker.internal:7890 \
  -v $(pwd)/el-cl-genesis-data:/data \
  -v $(pwd)/config-example:/config \
  --rm \
  wangyufsn/ethereum-genesis-generator:2.0.4 all










