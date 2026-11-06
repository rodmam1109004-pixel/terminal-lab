# Casos de prueba de validador.sh

| Caso            | Entrada                 | Codigo esperado |
|-----------------|-------------------------|-----------------|
| Sin argumentos  | (ninguno)               | 2 |
| Ruta inexistente| ./no-existe             | 1 |
| Directorio      | ./datos/mi-dir          | 0 |
| Archivo regular | ./datos/archivo.txt     | 0 |
| Archivo vacio   | ./datos/vacio.txt       | 0 |
| Sin permiso     | ./datos/sin-lectura.txt | 3 |
| Tipo desconocido| /dev/null               | 4 |
