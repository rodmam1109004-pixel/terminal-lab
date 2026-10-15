#!/bin/bash
# explorar-sistema.sh - Recorre la jerarquia del sistema y la documenta
# Autor: Rodrigo Mamani Condori
# Fecha: 2026-10-15
# Uso: ./exploarar-sistema.sh
#Descripcion: recorre /etc, /var, /home, /bin, /tmp y /proc y documenta su funcion

sep="--------------------------------------------------------------" 

echo "=== /etc ==="
echo "/etc guarda archivos de configuracion del sistema en texto plano."
ls -l /etc | head -n 20
echo "$SEP"
echo " "

echo "=== /var ==="
echo "/var guarda datos que cambia: registros, colas y caches."
ls -lh /var | head -n 20
echo "$SEP"
echo " "

echo "=== /home ==="
echo "/home contiene un subdirectorio por usuario con sus archivos personales."
ls -l /home
echo "$SEP"
echo " "

