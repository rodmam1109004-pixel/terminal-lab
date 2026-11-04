# Semana 05 - Busqueda, archivado y entorno propio

## Que hace
'respaldar-trabajo.sh' busca los archivos de esta carpeta modificados en los
ultimos N dias (7 por omision), los empaqueta en 'respaldos/' con la fecha en
el nombre e informa cuantos archivos respaldo y cuanto pesa el paquete.
Excluye temporales ('*.tmp', '*~') y los respaldos anteriores.

## Archivos
- 'respaldar-trabajo.sh' - script principal
- 'bashrc-fragmento.txt' - linea agregada a ~/.bashrc para el PATH
- 'datos/' - archivos de prueba que se respaldan
- 'respaldos/' - paquetes generados (no se versionan)
- 'README.md' - este archivo

## Como se ejecuta
cd semana05
chmod +x respaldar-trabajo.sh
./respaldar-trabajo.sh          # ultimos 7 dias
./respaldar-trabajo.sh 30       # ultimos 30 dias
respaldar-trabajo 7             # ya instalado en ~/bin

## Que se aprendio
- Busqueda con 'find' por tipo y fecha, y exclusiones con '!'.
- Paso seguro de nombres con '-print0' y 'tar --null --files-from=-'.
- Creacion de comprimidos con 'tar -czf' y lectura con 'tar -tzf'.
- Calculo del directorio del propio script con 'BASH_SOURCE' y 'dirname'.
- Instalacion de un comando propio en ~/bin y modificacion del PATH.

## Que quedo pendiente
Extension opcional: borrar automaticamente los respaldos de mas de 30 dias.
