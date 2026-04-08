#!/bin/bash

set -e

echo "🔹 Instalando StormOS Repo..."

# 1. Crear carpeta para keyrings si no existe
sudo mkdir -p /etc/apt/keyrings

# 2. Descargar la clave pública
curl -fsSL https://raw.githubusercontent.com/acierto-incomodo/stormstore-linux-apt/main/public.key | sudo gpg --dearmor -o /etc/apt/keyrings/stormos.gpg

# 3. Crear archivo .list
echo "deb [signed-by=/etc/apt/keyrings/stormos.gpg] https://acierto-incomodo.github.io/stormstore-linux-apt stable main" | sudo tee /etc/apt/sources.list.d/stormos.list

# 4. Actualizar APT
sudo apt update

echo "✅ Repo StormOS agregado. Ahora puedes instalar paquetes con: sudo apt install nombre-paquete"