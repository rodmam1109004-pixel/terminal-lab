# Semana 09 - Procesos y senales

## Que hace

'monitor-procesos.sh' informa sobre los procesos del usuario actual: los lista
ordenados por consumo de CPU, senala el que mas consume y cuenta cuantos hay en
cada estado. Despues lanza un 'sleep' en segundo plano y lo termina en dos
etapas, primero con SIGTERM y, si no responde, con SIGKILL.

## Archivos

- 'monitor-procesos.sh' - script principal
- 'reporte-ejemplo.txt' - salida capturada del script
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana09
chmod +x monitor-procesos.sh
./monitor-procesos.sh
./monitor-procesos.sh > reporte-ejemplo.txt
'''
## Que se aprendio

- Seleccion de columnas y orden en 'ps' con '-o' y '--sort'.
- Estados de un proceso: R, S, D, T y Z.
- Lanzamiento en segundo plano con '&' y captura del PID con '$!'.
- Diferencia entre SIGTERM (se puede atender) y SIGKILL (no se puede ignorar).
- 'kill -0' para comprobar si un proceso sigue vivo sin enviarle ninguna senal.

## Que quedo pendiente

Extension opcional: capturar la interrupcion del propio script con
'trap 'kill $PID 2>/dev/null' EXIT' para no dejar el 'sleep' huerfano si se
interrumpe con Ctrl+C.
