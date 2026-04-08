#!/bin/bash

mkdir -p {conf,dists,pool}

cat <<EOF > conf/distributions
Codename: stable
Components: main
Architectures: amd64
EOF