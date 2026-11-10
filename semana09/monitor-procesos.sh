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

echo "=== Procesos del usuario ordenados por %CPU ==="
ps -u "$USER" -o pid,stat,%cpu,%mem,comm --sort=-%cpu | head -n 20
echo ""

echo "=== conteo por estado ==="
# La primera letra de STAT es el estado: R, S, D, T o Z
ps -u "$USER" -o stat | tail -n +2 | cut -c1 | sort | uniq -c
echo ""
