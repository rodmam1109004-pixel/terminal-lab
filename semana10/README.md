# Semana 10 - PowerShell 7: otra terminal

## Que hace
'explorar-sistema.ps1' recorre seis directorios del sistema y muestra, para
cada uno, su funcion y un listado de su contenido. Cierra con una seccion de
descubrimiento que usa 'Get-Command' y 'Get-Help' sobre los propios cmdlets
empleados.

## Archivos
- 'explorar-sistema.ps1' - script principal
- 'salida-ps.txt' - salida capturada del script
- 'README.md' - este archivo

## Como se ejecuta
'''
cd semana10
pwsh ./explorar-sistema.ps1
pwsh ./explorar-sistema.ps1 > salida-ps.txt
pwsh -Command "Get-Help ./explorar-sistema.ps1"
'''


## Que se aprendio
- Ayuda basada en comentarios: '.SYNOPSIS' y '.DESCRIPTION' en un bloque '<# #>'.
- Funciones con 'param()' y parametros con nombre y valor por omision.
- Que una funcion debe devolver objetos, y el formato aplicarse al final.
- Diferencia entre 'Write-Output' (va a la tuberia) y 'Write-Host' (solo pantalla).
- Descubrimiento con 'Get-Command -Noun' y 'Get-Help'.

## Que quedo pendiente
Extension opcional: aceptar la lista de directorios como parametro del script,
en lugar de tenerla fija en el codigo.
