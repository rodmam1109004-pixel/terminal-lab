# lib/tareas.sh - Operaciones sobre datos/tareas.csv
# Usa la variable DATOS, definida por gestor-tareas.sh

listar_tareas() {
  echo "--- Tareas ---"
  tail -n +2 "$DATOS" | while IFS=',' read -r id descripcion estado fecha; do
    echo "$id -> $descripcion ($estado, $fecha)"
  done
}

agregar_tarea() {
  local desc id
  read -rp "Descripcion (sin comas): " desc
  validar_no_vacia "$desc" || return 1
  # El id nuevo es el mayor existente mas uno
  id=$(awk -F, 'NR>1 && $1>max {max=$1} END {print max+1}' "$DATOS")
  echo "$id,$desc,pendiente,$(date +%F)" >> "$DATOS"
  echo "Tarea $id agregada."
}

completar_tarea() {
  local id
  read -rp "Id de la tarea a completar: " id
  validar_id "$id" || return 1
  awk -F, -v id="$id" 'BEGIN {OFS=","} $1==id {$3="completada"} 1' \
    "$DATOS" > "$DATOS.tmp" && mv "$DATOS.tmp" "$DATOS"
  echo "Tarea $id completada."
}

eliminar_tarea() {
  local id
  read -rp "Id de la tarea a eliminar: " id
  validar_id "$id" || return 1
  # El patron incluye la coma: asi el id 1 no borra tambien el 10
  grep -v "^$id," "$DATOS" > "$DATOS.tmp" || true
  mv "$DATOS.tmp" "$DATOS"
  echo "Tarea $id eliminada."
}
