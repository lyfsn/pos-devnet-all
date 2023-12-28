

docker run \
  --rm \
  -p 9782:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://88.99.94.109:10745" \
  --env BEACON_API_URL="http://88.99.94.109:4400" \
  otterscan/otterscan:v2.2.0

