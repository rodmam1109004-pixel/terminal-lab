#!/bin/bash
# info-sistema.sh - Reporte del sistema con opciones -u, -d y -h
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./info-sistema.sh [-u] [-d] [-h]
# Codigos de salida: 0 exito, 2 uso incorrecto

set -euo pipefail

uso() {
    echo "Uso: $0 [-u] [-d] [-h]" >&2
    echo "  sin argumentos   resumen general del sistema" >&2
    echo "  -u               datos del usuario" >&2
    echo "  -d               uso de disco" >&2
    echo "  -h               muestra esta ayuda" >&2
    exit 2
}

if [[ "${1:-}" == "-h" ]]; then
    uso
fi

OPCION="${1:-}"

case "$OPCION" in
    "")
        echo "=== Sistema ==="
        uname -a
        head -n 5 /etc/os-release
        uptime -p
        free -h | head -n 2
        ;;
esac

exit 0
