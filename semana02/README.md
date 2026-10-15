# Semana 02 - Fundamentos y sistema de archivos

## Que hace
'explorar-sistema.sh' recorre seis directorios de la jerarquia FHS (/etc, /var, 
/home, /bin, /tmp y /proc) y para cada uno imprime su funcion y un listado real 
de su contenido.

## Archivos
- 'explorar-sistema.sh' - script principal
- 'salida-ejemplo.txt' - salida capturada del script
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana02
chmod +x explorar-sistema.sh
./explorar-sistema.sh
./explorar-sistema.sh > salida-ejemplo.txt
'''

## Que se aprendio
- Diferencia entre rutas absolutas y relativas y uso de 'pwd' y 'cd'.
- Lectura de 'ls -l': tipo, permisos, dueno, tamano y fecha.
- Uso de 'cat', 'less', 'head' y 'file' para inspeccionar archivos.
- Redireccion de la salida a un archivo con '>'.

## Que quedo pendiente
Extension opcional: listar los cinco elementos mas grandes de cada directorio
con 'ls -S | head -n 5'.
