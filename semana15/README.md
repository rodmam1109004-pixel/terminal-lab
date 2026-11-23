## Que hace
`gestor-tareas.ps1` presenta un menu de cinco opciones para gestionar tareas
guardadas en `datos/tareas.csv`. Las cuatro operaciones viven en el modulo
`lib/Tareas.psm1`, que se carga con `Import-Module` y valida sus parametros.

## Archivos
- `gestor-tareas.ps1` - menu principal
- `lib/Tareas.psm1` - modulo con Get-Tareas, Add-Tarea, Set-TareaEstado y Remove-Tarea
- `datos/tareas.csv` - datos, con cabecera Id,Descripcion,Estado,Fecha
- `README.md` - este archivo

## Como se ejecuta
'''
cd semana15
pwsh ./gestor-tareas.ps1
pwsh ./gestor-tareas.ps1 -Ruta datos/otras-tareas.csv
pwsh -Command "Get-Help ./gestor-tareas.ps1"
'''
El menu es interactivo. Para probar las operaciones sin el menu:
'''
pwsh -Command "Import-Module ./lib/Tareas.psm1 -Force; Add-Tarea -Descripcion 'prueba'; Get-Tareas"
'''

## Que se aprendio
- Modulos `.psm1`, `Import-Module` `-Force` y `Export-ModuleMember`.
- Parametros obligatorios con `[Parameter(Mandatory)]`.
- Validacion automatica de valores con `[ValidateSet(...)]`.
- `try/catch` y por que exige `-ErrorAction Stop` para funcionar.
- Ayuda con `.SYNOPSIS`, `.PARAMETER` y `.EXAMPLE`, visible con `Get-Help`.
- `$PSScriptRoot` y `Join-Path` para rutas independientes del directorio actual.

## Que quedo pendiente
Extension opcional: agregar `Get-Tareas -Estado pendiente` para filtrar el
listado por estado.
