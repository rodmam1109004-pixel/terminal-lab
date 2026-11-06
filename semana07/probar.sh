#!/bin/bash
# probar.sh - Ejecuta los casos de casos-prueba.md y compara los codigos
# Autor: Nombre Apellido
# Uso: ./probar.sh
# Nota: sin -e, porque aqui un codigo distinto de 0 es lo esperado

set -uo pipefail

probar() {
    local descripcion="$1"
    local esperado="$2"
    shift 2
    ./validador.sh "$@" > /dev/null 2>&1
    local obtenido=$?
    if [[ "$obtenido" -eq "$esperado" ]]; then
        echo "OK    $descripcion (codigo $obtenido)"
    else
        echo "FALLA $descripcion (esperado $esperado, obtenido $obtenido)"
    fi
}

probar "Ruta inexistente" 1 ./no-existe
probar "Directorio"       0 ./datos/mi-dir
probar "Archivo regular"  0 ./datos/archivo.txt
probar "Archivo vacio"    0 ./datos/vacio.txt
probar "Sin permiso"      3 ./datos/sin-lectura.txt
probar "Tipo desconocido" 4 /dev/null
probar "Sin argumentos"   2

