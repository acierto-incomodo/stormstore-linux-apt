#!/bin/bash
# Configura la estructura base del repo

mkdir -p {conf,dists,pool,debs}

cat <<EOF > conf/distributions
Codename: stable
Components: main
Architectures: amd64
EOF

echo "✅ Estructura del repo creada"