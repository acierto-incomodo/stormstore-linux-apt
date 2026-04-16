#!/bin/bash
# Firma el repo con GPG

echo "🔐 Configurando firma del repositorio..."

# Comprobar si ya hay clave GPG
KEY_ID=$(gpg --list-secret-keys --with-colons 2>/dev/null | grep '^sec' | cut -d: -f5 | head -n1)

if [ -z "$KEY_ID" ]; then
  echo "No hay clave GPG. Creando una..."
  gpg --batch --gen-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: StormStore Repo
Name-Email: stormstore@local
Expire-Date: 0
%no-protection
%commit
EOF
  KEY_ID=$(gpg --list-secret-keys --with-colons | grep '^sec' | cut -d: -f5 | head -n1)
fi

echo "✅ Usando clave: $KEY_ID"

# Configurar reprepro para firmar
cat <<EOF > conf/distributions
Codename: stable
Components: main
Architectures: amd64
SignWith: $KEY_ID
EOF

# Exportar clave pública
gpg --armor --export $KEY_ID > public.key
echo "📤 Clave pública exportada"

# Exportar repo firmado
reprepro -b . export

echo "✅ Repo firmado"