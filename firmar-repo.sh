#!/bin/bash

echo "🔐 Configurando firma del repositorio..."

# 1. Comprobar si ya hay clave GPG
KEY_ID=$(gpg --list-secret-keys --with-colons 2>/dev/null | grep '^sec' | cut -d: -f5 | head -n1)

if [ -z "$KEY_ID" ]; then
  echo "No tienes clave GPG. Creando una..."

  gpg --batch --gen-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: StormOS Repo
Name-Email: stormos@local
Expire-Date: 0
%no-protection
%commit
EOF

  KEY_ID=$(gpg --list-secret-keys --with-colons | grep '^sec' | cut -d: -f5 | head -n1)
fi

echo "✅ Usando clave: $KEY_ID"

# 2. Configurar reprepro
cat <<EOF > conf/distributions
Codename: stable
Components: main
Architectures: amd64
SignWith: $KEY_ID
EOF

echo "📦 Configuración aplicada"

# 3. Exportar clave pública
gpg --armor --export $KEY_ID > public.key

echo "📤 Clave pública exportada como public.key"

# 4. Exportar repo firmado
reprepro -b . export

echo "✅ Repo firmado correctamente"