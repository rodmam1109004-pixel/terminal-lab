#!/bin/bash
# organizar-archivos.sh - Clasifica archivos por extension y aplica permisos
# Autor: Nombre Apellido
# Fecha: 2026-02-15
# Uso: ./organizar-archivos.sh
# Descripcion: genera 50 archivos en trabajo/ y los clasifica en organized/
#              por extension, aplicando permisos distintos a cada categoria.

# Carpetas de trabajo y de destino
mkdir -p trabajo
mkdir -p organized/scripts organized/documentos organized/imagenes
mkdir -p organized/registros organized/otros

# Generacion local de los 50 archivos de entrada (10 por extension)
touch trabajo/archivo{1..10}.sh
touch trabajo/doc{1..10}.txt
touch trabajo/foto{1..10}.jpg
touch trabajo/reg{1..10}.log
touch trabajo/nota{1..10}.md

echo -n "Archivos generados: "
ls -1 trabajo | wc -l

# Clasificacion: el shell expande *.ext antes de ejecutar mv
mv -f trabajo/*.sh organized/scripts/
mv -f trabajo/*.txt organized/documentos/
mv -f  trabajo/*.md organized/documentos/
mv -f trabajo/*.jpg organized/imagenes/
mv -f trabajo/*.log organized/registros/

# Permisos por categoria
chmod 755 organized/scripts/*.sh
chmod 644 organized/documentos/* organized/imagenes/*
chmod 444 organized/registros/*
chmod 755 organized organized/scripts organized/documentos
chmod 755 organized/imagenes organized/registros organized/otros

# Resumen por categoria
echo "Resumen por categoria:"
echo -n "scripts:    "; ls -1 organized/scripts    | wc -l
echo -n "documentos: "; ls -1 organized/documentos | wc -l
echo -n "imagenes:   "; ls -1 organized/imagenes   | wc -l
echo -n "registros:  "; ls -1 organized/registros  | wc -l
echo -n "otros:      "; ls -1 organized/otros      | wc -l
echo "Clasificacion completada."
