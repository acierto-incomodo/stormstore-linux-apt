#!/bin/bash
# Detiene el script si un comando falla
set -e
# Detiene el script si un comando en una tubería falla
set -o pipefail

echo "🚀 Iniciando la gestión del repositorio StormStore APT..."

# Paso 2: Configurar la estructura base del repositorio si no existe
# Verifica si los directorios esenciales (conf, dists, pool, debs, appstream) están presentes.
# Si falta alguno, ejecuta el script de configuración inicial.
if [ ! -d "conf" ] || [ ! -d "dists" ] || [ ! -d "pool" ] || [ ! -d "debs" ] || [ ! -d "appstream" ]; then
  echo "⚙️ Detectada estructura de repositorio incompleta o ausente. Ejecutando configuración inicial..."
  ./configure.sh
else
  echo "✅ Estructura del repositorio ya existente. Saltando configuración inicial."
fi

echo "" # Salto de línea para mejor legibilidad

# Paso 3: Añadir paquetes .deb y metadatos AppStream al repositorio
# Incorpora los paquetes y sus metadatos al índice de reprepro.
./añadir-paquetes.sh

# Paso 1: Generar metadatos AppStream para los paquetes
# Esto crea archivos .appdata.xml.gz en el directorio 'appstream/'
./generar-appstream.sh

# Paso 4: Firmar el repositorio con GPG
# Genera una clave GPG si no existe y firma los índices del repositorio.
./firmar-repo.sh

echo "🎉 Proceso de gestión del repositorio StormStore APT completado."