#!/bin/bash

set -e

echo "🔹 Instalando StormStore Repo (amd64)..."

# 1. Crear carpeta para keyrings si no existe
sudo mkdir -p /etc/apt/keyrings

# 2. Descargar la clave pública
curl -fsSL https://raw.githubusercontent.com/acierto-incomodo/stormstore-linux-apt/main/public.key | sudo gpg --dearmor -o /etc/apt/keyrings/stormstore.gpg

# 3. Crear archivo .list con arch=amd64
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/stormstore.gpg] https://acierto-incomodo.github.io/stormstore-linux-apt stable main" | sudo tee /etc/apt/sources.list.d/stormstore.list

# 4. Actualizar APT
sudo apt update

echo "✅ Repo StormStore (amd64) agregado. Ahora puedes instalar paquetes con: sudo apt install nombre-paquete"