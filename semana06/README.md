# Semana 06 - Bash: fundamentos

## Que hace

'info-sistema.sh' genera un reporte del sistema que cambia segun el argumento recibido: sin argumentos muestra el resumen general (kernel, distribucion, tiempo encendido y memoria), con `-u` los datos del usuario y con `-d` el uso de disco. Con `-h` muestra la ayuda.

## Archivos

- 'info-sistema.sh' - script principal
- 'salida-ejemplo.txt' - las tres invocaciones concatenadas
- 'README.md' - este archivo

## Como se ejecuta
'''

cd semana06
chmod +x info-sistema.sh
./info-sistema.sh        # resumen general
./info-sistema.sh -u     # usuario
./info-sistema.sh -d     # disco
./info-sistema.sh -h     # ayuda
'''

## Codigos de salida

- 0 - exito
- 2 - uso incorrecto (-h u opcion invalida)

## Que se aprendio

- Estructura 'case' para despachar segun el argumento recibido.
- Definicion y llamada de funciones en Bash.
- Diferencia entre salida estandar y salida de error, y uso de '>&2'.
- Codigos de salida y como leerlos con 'echo $?'.
- '${1:-}' para leer un argumento que puede no existir con 'set -u' activo.

## Que quedo pendiente

Extension opcional: aceptar varias opciones en la misma llamada, por ejemplo'./info-sistema.sh -u -d'.
