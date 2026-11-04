#!/bin/bash
# respaldar-trabajo.sh - Respalda los archivos modificados en los ultimos N dias
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./respaldar-trabajo.sh [dias]    (por omision, 7 dias)
# Descripcion: empaqueta en respaldos/ los archivos recientes de esta carpeta,
#              excluyendo temporales y los respaldos anteriores.

set -euo pipefail

# Directorio real del script, para que funcione tambien instalado en ~/bin
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DIAS="${1:-7}"
DEST="$SCRIPT_DIR/respaldos"
mkdir -p "$DEST"
NOMBRE="respaldo-$(date +%F).tar.gz"
RUTA="$DEST/$NOMBRE"
