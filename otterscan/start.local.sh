

docker run \
  --rm \
  -p 9782:80 \
  --name otterscan \
  -d \
  --env ERIGON_URL="http://127.0.0.1:8745" \
  --env BEACON_API_URL="http://127.0.0.1:4409" \
  otterscan/otterscan:v2.2.0



