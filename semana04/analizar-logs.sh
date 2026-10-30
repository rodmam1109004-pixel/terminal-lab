#!/bin/bash
# analizar-logs.sh - Procesa acceso.log y genera un reporte de 4 secciones
# Autor: Rodrigo
# Fecha: 2026-02-15
# Uso: ./analizar-logs.sh
# Descripcion: lee acceso.log (en esta misma carpeta) y resume IPs, estados, errores 500 y hora pico usando tuberias.

LOG="acceso.log"

echo "=== Top 5 IP con mas peticiones ==="
# La IP es el campo 1 de cada linea
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "=== Conteo por codigo de estado ==="
# El estado es el campo 9 en el formato Apache usado aqui
awk '{print $9}' "$LOG" | sort | uniq -c | sort -n

