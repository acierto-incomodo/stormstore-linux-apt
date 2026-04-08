#!/bin/bash

echo "Añadiendo paquetes al repo..."

for deb in ./debs/*.deb; do
  echo "Procesando $deb"
  reprepro -b . includedeb stable "$deb"
done

echo "Listo ✅"