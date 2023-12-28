

docker run \
  -d --name nodemonitor \
  -p 9778:8080 \
  -v ./devnet.toml:/config.toml \
  holiman/nodemonitor:latest /config.toml

