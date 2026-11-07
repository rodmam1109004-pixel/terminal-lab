# Semana 08 - Bash: loops, arrays y funciones

## Que hace
'gestor-tareas.sh' presenta un menu con cinco opciones para gestionar tareas 
guardadas en 'datos/tareas.csv': listar, agregar, completar, eliminar y salir. 
La logica esta separada en 'lib/': las validaciones por un lado y las 
operaciones sobre el CSV por otro.

## Archivos
- 'gestor-tareas.sh' - menu principal
- 'lib/validaciones.sh' - validaciones de descripcion e id
- 'lib/tareas.sh' - listar, agregar, completar y eliminar
- 'datos/tareas.csv' - datos, con cabecera id,descripcion,estado,fecha
- 'README.md' - este archivo

## Como se ejecuta
'''

cd semana08
chmod +x gestor-tareas.sh
./gestor-tareas.sh
'''


Tambien se puede alimentar desde una tuberia, util para probar:
'''

printf '2\ncomprar cuaderno\n1\n5\n' | ./gestor-tareas.sh
'''

## Que se aprendio
- Lectura de un CSV linea por linea con 'while IFS=, read -r'.
- Funciones con 'local' y 'return', cargadas con 'source' desde lib/.
- Menu con 'while true' y 'caso', incluyendo la rama por defecto.
- Edicion segura de un archivo mediante temporal y 'mv'.
- Por que el patron de borrado incluye la coma: para no confundir 1 con 10.

## Que quedo pendiente
Extension opcional: filtrar el listado por estado, mostrando solo las pendientes.
