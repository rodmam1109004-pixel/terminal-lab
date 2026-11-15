# Semana 11 - El modelo de objetos

## Que hace
'analizar-datos.ps1' convierte cada linea de 'acceso.log' en un objeto con las
propiedades IP, Hora, Recurso, Estado y Bytes, y a partir de esa coleccion
responde: que IP pide mas, cuantas peticiones hay por codigo de estado, cuales
fallaron con error 500, cual fue la hora pico y cuanto trafico se genero.

## Archivos
- 'analizar-datos.ps1' - script principal
- 'acceso.log' - registro de entrada de 15 lineas
- 'reporte-ps.txt' - reporte generado
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana11
pwsh ./analizar-datos.ps1
pwsh ./analizar-datos.ps1 > reporte-ps.txt
pwsh ./analizar-datos.ps1 -Log otro-registro.log
'''
## Que se aprendio
- Construccion de objetos propios con '[PSCustomObject]@{...}'.
- Captura de grupos de una expresion regular con '-match' y '$Matches'.
- Conversion de tipos con '[int]' y por que importa para comparar y sumar.
- Agrupacion con 'Group-Object' sin necesidad de ordenar antes.
- Filtrado por propiedad con 'Where-Object' y calculos con 'Measure-Object'.

## Que quedo pendiente
Extension opcional: exportar los objetos a CSV con 'Export-Csv' y volver a
leerlos con 'Import-Csv'.
