# Semana 14 - Procesos y control de la salida

## Que hace
'monitor-procesos.ps1' toma una instantanea de los procesos en ejecucion y
muestra los que mas memoria consumen, cual encabeza la lista y cuantas
instancias hay de cada programa. Ejecuta ademas un conteo en segundo plano con
'Start-Job' y exporta los datos a 'procesos.csv'.

## Archivos
- 'monitor-procesos.ps1' - script principal
- 'procesos.csv' - reporte exportado
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana14
pwsh ./monitor-procesos.ps1
pwsh ./monitor-procesos.ps1 -Top 5
pwsh ./monitor-procesos.ps1 -Salida otro-reporte.csv
'''
## Regla que no hay que olvidar
'Format-*' va siempre al final y solo para la pantalla. Nunca antes de un
'Export-*': lo que se exporta deben ser los objetos, no la tabla formateada.

## Que se aprendio
- Propiedades calculadas y las constantes de tamano 1KB, 1MB y 1GB.
- 'Group-Object' para contar instancias de un mismo programa.
- Trabajos en segundo plano: 'Start-Job', 'Wait-Job', 'Receive-Job', 'Remove-Job'.
- Por que 'CPU' puede venir vacio y como afecta al ordenar.
- La diferencia entre datos y presentacion al exportar.

## Que quedo pendiente
Extension opcional: agregar un parametro '-MinMemMB' que filtre los procesos
por debajo de cierto consumo antes de exportar.
