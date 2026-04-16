#!/bin/bash
set -e

echo "🔹 Instalando StormStore Repo (amd64)..."

sudo mkdir -p /etc/apt/keyrings

# Descargar clave pública
curl -fsSL https://raw.githubusercontent.com/acierto-incomodo/stormstore-linux-apt/main/public.key | sudo gpg --dearmor -o /etc/apt/keyrings/stormstore.gpg

# Crear archivo .list
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/stormstore.gpg] https://acierto-incomodo.github.io/stormstore-linux-apt stable main" | sudo tee /etc/apt/sources.list.d/stormstore.list

# Actualizar APT y cache AppStream
sudo apt update
sudo appstreamcli refresh-cache

echo "✅ Repo instalado. Ahora Discover y apt pueden ver los paquetes"