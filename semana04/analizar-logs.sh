#!/bin/bash
# analizar-logs.sh - Procesa acceso.log y genera un reporte de 4 secciones
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./analizar-logs.sh
# Descripción: lee acceso.log (en esta misma carpeta) y resume IPs, estados,
#              errores 500 y hora pico usando tuberías.

LOG="acceso.log"  # Nombre del archivo que va a leer

echo "=== Top 5 IP con mas peticiones ==="
# La IP es el campo 1 de cada linea
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n 5
