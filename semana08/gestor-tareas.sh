#!/bin/bash
# gestor-tareas.sh - Menu principal del gestor de tareas
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./gestor-tareas.sh
# Descripcion: gestiona tareas guardadas en datos/tareas.csv

set -euo pipefail

# Ruta real del script, para que funcione desde cualquier directorio
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATOS="$SCRIPT_DIR/datos/tareas.csv"

# Si el archivo de datos no existe, se crea con su cabecera
if [[ ! -f "$DATOS" ]]; then
  mkdir -p "$SCRIPT_DIR/datos"
  echo "id,descripcion,estado,fecha" > "$DATOS"
fi

source "$SCRIPT_DIR/lib/validaciones.sh"
source "$SCRIPT_DIR/lib/tareas.sh"

while true; do
  echo ""
  echo "1) Listar   2) Agregar   3) Completar   4) Eliminar   5) Salir"
  read -rp "Opcion: " op
  case "$op" in
    1) listar_tareas ;;
    2) agregar_tarea || true ;;
    3) completar_tarea || true ;;
    4) eliminar_tarea || true ;;
    5) echo "Hasta luego."; exit 0 ;;
    *) echo "Opcion invalida: $op" >&2 ;;
  esac
done
