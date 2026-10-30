# Semana 04 - Procesamiento de texto y pipes

## Que hace
'analizar-logs.sh' procesa 'acceso.log' (20 lineas en formato Apache, generadas 
en esta misma carpeta) y produce un reporte con cuatro secciones: top de IP, 
conteo por codigo de estado, lineas con error 500 y hora pico.

## Archivos
- 'analizar-logs.sh' - script principal (4 tuberias)
- 'acceso.log' - registro de entrada de 20 lineas
- 'reporte-ejemplo.txt' - reporte guardado con '>'
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana04
chmod +x analizar-logs.sh
./analizar-logs.sh
./analizar-logs.sh > reporte-ejemplo.txt
'''


## Que se aprendio
- Tuberias 'awk | sort | uniq -c | sort -nr | head' para contar y ranquear.
- Que 'uniq -c' exige que la entrada venga ordenada.
- Redireccion '>' y '>>' para guardar reportes.
- Uso de '||' para dar una alternativa cuando 'grep' no encuentra nada.

## Que quedo pendiente
Extension opcional: agregar el conteo por recurso con 'awk '{print $7}''.
