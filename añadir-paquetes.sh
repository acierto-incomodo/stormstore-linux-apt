#!/bin/bash
# Añade paquetes .deb y AppStream metadata al repo

echo "🔹 Añadiendo paquetes al repo..."

# 1️⃣ Añadir paquetes .deb
for deb in ./debs/*.deb; do
  echo "Procesando $deb"
  reprepro -b . includedeb stable "$deb"
done

# 2️⃣ Copiar metadata AppStream
mkdir -p dists/stable/main/binary-amd64/appstream
for xml in ./appstream/*.xml.gz; do
    echo "Copiando metadata $xml"
    cp "$xml" dists/stable/main/binary-amd64/appstream/
done

# 3️⃣ Actualizar repo
reprepro -b . export

echo "✅ Paquetes y AppStream añadidos"