#!/bin/bash
# Genera archivos .appdata.xml.gz para cada .deb en debs/

mkdir -p appstream

for deb in debs/*.deb; do
    filename=$(basename "$deb" .deb)
    xml_file="appstream/${filename}.appdata.xml"

    echo "🔹 Generando AppStream metadata para $filename"

    cat <<EOF > "$xml_file"
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop">
  <id>$filename.desktop</id>
  <name>$filename</name>
  <summary>Aplicación $filename</summary>
  <description>Instala $filename desde StormStore Repo.</description>
  <launchable type="desktop-id">$filename.desktop</launchable>
  <provides>
    <binary>$filename</binary>
  </provides>
  <url type="homepage">https://stormstore.vercel.app/</url>
</component>
EOF

    # Comprimirlo
    gzip -k -f "$xml_file"
done

echo "✅ Todos los archivos AppStream generados en appstream/"