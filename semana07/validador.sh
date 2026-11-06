#!/bin/bash
# validador.sh - Valida una ruta y devuelve un codigo distinto por cada fallo
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./validador.sh <ruta>
# Codigos: 0 exito, 1 no existe, 2 uso incorrecto, 3 sin lectura,
#          4 tipo desconocido

set -euo pipefail

uso() {
    echo "Uso: $0 <ruta>" >&2
    exit 2
}

# Exige exactamente un argumento
[[ $# -eq 1 ]] || uso

RUTA="$1"
