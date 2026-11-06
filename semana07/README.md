# Semana 07 - Bash: condicionales

## Que hace
'validador.sh' recibe una ruta, informa si es un enlace, un directorio o un 
archivo regular, comprueba permisos y contenido, y devuelve un codigo de salida 
distinto para cada situacion. 'probar.sh' ejecuta los siete casos de 
'casos-prueba.md' y compara los codigos obtenidos con los esperados.

## Archivos
- 'validador.sh' - script principal
- 'probar.sh' - ejecutor de los casos de prueba
- 'casos-prueba.md' - tabla de casos y codigos esperados
- 'datos/' - archivos de prueba
- 'README.md' - este archivo

## Como se ejecuta
'''

cd semana07
chmod +x validador.sh probar.sh
./validador.sh ./datos/archivo.txt
./probar.sh
'''

## Codigos de salida
- 0 - exito (enlace, directorio o archivo legible, incluido el vacio)
- 1 - la ruta no existe
- 2 - uso incorrecto
- 3 - sin permiso de lectura
- 4 - tipo desconocido

## Que se aprendio
- Pruebas de archivo: -e, -f, -d, -L, -r, -s, y por que -L va primero.
- Uso de '[[ ... ]] || comando' para exigir condiciones.
- Codigos de salida distintos por tipo de fallo, y como leerlos con '$?'.
- Escribir los casos de prueba antes que el codigo.
- Funciones con 'local' y 'shift' para reutilizar logica de prueba.

## Que quedo pendiente
Extension opcional: aceptar varias rutas en una sola llamada y devolver el peor codigo encontrado.
