

mkdir -p el-cl-genesis-data
mkdir -p execution-data
mkdir -p consensus-data


export IP_ADDRESS=88.99.94.109
export EL_BOOTNODES="enode://52f2f987e207f6e4a158d42c577b08b687136b76e3e388d1690fd76a027d3ee921f0e159c822aff59d50e1f72afdcd9dfa8a59f90aa3b27af2d1daf2b0028634@127.0.0.1:50303?discport=30303"
export CL_BOOTNODES="enr:-MS4QNVIPRZgoQVMMZUuGt0daVCt1BvGWpNM5WQRfQpqI-C1QzuvsaUA6V3gS8KQaP0_iqi20AmCVR-v2kBc96-C56oBh2F0dG5ldHOIAAAAAAAAAACEZXRoMpBngW9pQAAAAf__________gmlkgnY0gmlwhH8AAAGEcXVpY4IjKYlzZWNwMjU2azGhA-dXQM-a23XWfIS-2sjk55oYBaBnecORBSD_GezzIz7PiHN5bmNuZXRzAIN0Y3CCIyiDdWRwgiMo"
export CL_STATICPEERS="/ip4/0.0.0.0/tcp/9000/p2p/16Uiu2HAmUE3hKSo1kXt8AhJM9YdXMYbRizyYrM9xMahWyxPm81eN"



docker compose -f compose.yaml up -d


