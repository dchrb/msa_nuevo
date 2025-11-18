#!/bin/bash
# Script para subir el código a GitHub de forma automática.

echo "✅ Paso 1: Preparando todos los ficheros..."
git add .

echo "✅ Paso 2: Guardando una instantánea de los cambios..."
# Usamos la fecha para que el mensaje del commit no cause conflictos.
git commit -m "Deploy automático: $(date)"

echo "✅ Paso 3: Asegurando que la rama principal se llama 'main'..."
git branch -M main

echo "✅ Paso 4: Conectando con tu repositorio en GitHub..."
# Si el repositorio remoto 'origin' ya existe, actualiza la URL. Si no, la añade.
if git remote | grep -q 'origin'; then
    git remote set-url origin https://github.com/dchrb28-netizen/msa_nuevo.git
else
    git remote add origin https://github.com/dchrb28-netizen/msa_nuevo.git
fi

echo "⏳ Paso 5: Subiendo el código a GitHub..."
echo ""
echo "======================================================================="
echo "  ATENCIÓN: Introduce tu usuario y contraseña de GitHub a continuación."
echo "  (La contraseña no se verá mientras la escribes, es normal)."
echo "======================================================================="
echo ""

git push -u origin main

echo ""
echo "🎉 ¡Éxito! El código ha sido subido a tu repositorio."
