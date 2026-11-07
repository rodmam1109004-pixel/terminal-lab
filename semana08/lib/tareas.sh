# lib/tareas.sh - Operaciones sobre datos/tareas.csv
# Usa la variable DATOS, definida por gestor-tareas.sh

listar_tareas() {
  echo "--- Tareas ---"
  tail -n +2 "$DATOS" | while IFS=',' read -r id descripcion estado fecha; do
    echo "$id -> $descripcion ($estado, $fecha)"
  done
}
