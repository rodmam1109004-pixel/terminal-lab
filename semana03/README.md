# Semana 03 - Archivos, permisos y multiusuario

## Que hace
'organizar-archivos.sh' genera 50 archivos de prueba en 'trabajo/', los
clasifica por extension en cinco categorias dentro de 'organized/' y aplica a
cada categoria los permisos que le corresponden.

## Archivos
- 'organizar-archivos.sh' - script principal
- 'README.md' - este archivo
- 'trabajo/' - 50 archivos de entrada generados por el script (no se versiona)
- 'organized/ - clasificacion resultante (no se versiona)

## Como se ejecuta
cd semana03
chmod +x organizar-archivos.sh
./organizar-archivos.sh

## Que se aprendio
- Generacion de datos con expansion de llaves '{1..10}'.
- Clasificacion con comodines '*.sh', '*.txt' y 'mv'.
- Permisos octales 755, 644 y 444, y que en un directorio la 'x' significa entrar.
- Que las carpetas generadas no se versionan: para eso esta el '.gitignore'.

## Que quedo pendiente
Extension opcional: guardar el resumen en un archivo con '>' ademas de mostrarlo
en pantalla.
