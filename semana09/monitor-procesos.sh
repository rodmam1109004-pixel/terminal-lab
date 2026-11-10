#!/bin/bash
# monitor-procesos.sh - Monitor de los procesos del usuario actual
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./monitor-procesos.sh
# Descripcion: informa procesos por consumo y por estado, y demuestra el
#              ciclo completo de lanzar y terminar un proceso.
#

set -euo pipefail

echo "=== Monitor de procesos ==="
echo "Usuario: $USER"
echo "Fecha: $(date)"
echo ""
