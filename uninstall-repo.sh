#!/bin/bash

set -e

echo "🔹 Desinstalando StormStore Repo..."

# 1. Eliminar archivo de lista del repo
if [ -f /etc/apt/sources.list.d/stormstore.list ]; then
    sudo rm /etc/apt/sources.list.d/stormstore.list
    echo "✔️ Archivo de lista eliminado"
else
    echo "⚠️ No se encontró el archivo de lista"
fi

# 2. Eliminar keyring
if [ -f /etc/apt/keyrings/stormstore.gpg ]; then
    sudo rm /etc/apt/keyrings/stormstore.gpg
    echo "✔️ Keyring eliminado"
else
    echo "⚠️ No se encontró el keyring"
fi

# 3. Actualizar APT
sudo apt update

echo "✅ Repo StormStore desinstalado. Los paquetes instalados permanecen, puedes eliminarlos manualmente si quieres."