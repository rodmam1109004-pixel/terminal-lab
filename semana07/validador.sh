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

# -L va primero: un enlace roto no cumple -e y quedaria como "no existe"
if [[ -L "$RUTA" ]]; then
    echo "Es enlace simbolico: $RUTA"
    ls -l "$RUTA"
    exit 0
fi

if [[ ! -e "$RUTA" ]]; then
    echo "No existe: $RUTA" >&2
    exit 1
fi

if [[ -d "$RUTA" ]]; then
    echo "Es directorio: $RUTA"
    ls -ld "$RUTA"
    exit 0
fi

if [[ -f "$RUTA" ]]; then
    echo "Es archivo regular: $RUTA"
    if [[ ! -r "$RUTA" ]]; then
        echo "Sin permiso de lectura: $RUTA" >&2
        exit 3
    fi
    ls -l "$RUTA"
    wc -l "$RUTA"
    [[ -s "$RUTA" ]] || echo "(archivo vacio)"
    exit 0
fi

# No fue enlace, ni directorio, ni archivo regular
echo "Tipo desconocido: $RUTA" >&2
exit 4
