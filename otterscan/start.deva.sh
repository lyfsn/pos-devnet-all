

docker run \
  --rm \
  -p 9782:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://88.99.94.109:18545" \
  --env BEACON_API_URL="http://88.99.94.109:4510" \
  otterscan/otterscan:v2.2.0

