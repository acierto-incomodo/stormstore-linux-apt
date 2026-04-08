#!/bin/bash

set -e

echo "🔹 Desinstalando StormOS Repo..."

# 1. Eliminar archivo de lista del repo
if [ -f /etc/apt/sources.list.d/stormos.list ]; then
    sudo rm /etc/apt/sources.list.d/stormos.list
    echo "✔️ Archivo de lista eliminado"
else
    echo "⚠️ No se encontró el archivo de lista"
fi

# 2. Eliminar keyring
if [ -f /etc/apt/keyrings/stormos.gpg ]; then
    sudo rm /etc/apt/keyrings/stormos.gpg
    echo "✔️ Keyring eliminado"
else
    echo "⚠️ No se encontró el keyring"
fi

# 3. Actualizar APT
sudo apt update

echo "✅ Repo StormOS desinstalado. Los paquetes instalados permanecen, puedes eliminarlos manualmente si quieres."