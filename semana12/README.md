# Semana 12 - Filtrado, seleccion y agregacion

## Que hace
'consultas.ps1' responde seis preguntas sobre 'datos.csv': que filas superan un
umbral, como agregar una columna calculada, cuanto suma y promedia cada
categoria, que filas cumplen dos condiciones a la vez, que categorias distintas
existen y cuales son los totales del conjunto. Cada consulta es una funcion.

## Archivos
- 'consultas.ps1' - script principal con las seis consultas
- 'datos.csv' - datos de entrada, cabecera y diez filas
- 'salida-consultas.txt' - resultado de las seis consultas
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana12
pwsh ./consultas.ps1
pwsh ./consultas.ps1 > salida-consultas.txt
pwsh ./consultas.ps1 -Csv otro-archivo.csv
'''

## Que se aprendio
- 'Import-Csv' convierte una tabla en objetos usando la cabecera.
- Por que hay que convertir a '[int]': "90" -gt "100" es verdadero como texto.
- Columnas calculadas con '@{Name=...; Expression=...}'.
- 'Group-Object' y su propiedad 'Group', que conserva los objetos del grupo.
- Cuando 'Where-Object' admite la forma corta y cuando hacen falta llaves.
- Que 'Format-Table' sobre cadenas muestra Length en vez del valor.

## Que quedo pendiente
Extension opcional: exportar el resumen por categoria a un CSV nuevo con
'Export-Csv'.
