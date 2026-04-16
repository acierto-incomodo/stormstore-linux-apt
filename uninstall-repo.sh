#!/bin/bash
set -e

echo "🔹 Desinstalando StormStore Repo..."

if [ -f /etc/apt/sources.list.d/stormstore.list ]; then
    sudo rm /etc/apt/sources.list.d/stormstore.list
    echo "✔️ Archivo de lista eliminado"
else
    echo "⚠️ No se encontró el archivo de lista"
fi

if [ -f /etc/apt/keyrings/stormstore.gpg ]; then
    sudo rm /etc/apt/keyrings/stormstore.gpg
    echo "✔️ Keyring eliminado"
else
    echo "⚠️ No se encontró el keyring"
fi

sudo apt update
echo "✅ Repo desinstalado. Los paquetes instalados permanecen"