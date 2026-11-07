# lib/validaciones.sh - Validaciones de entrada del gestor de tareas
# Este archivo no se ejecuta: se carga con source desde gestor-tareas.sh

# Rechaza una descripcion vacia o formada solo por espacios
validar_no_vacia() {
  if [[ -z "${1:-}" || -z "${1// /}" ]]; then
    echo "La descripcion no puede estar vacia" >&2
    return 1
  fi
  return 0
}

# Exige que el id sea un numero entero
validar_id() {
  if [[ ! "${1:-}" =~ ^[0-9]+$ ]]; then
    echo "El id debe ser un numero" >&2
    return 1
  fi
  return 0
}
