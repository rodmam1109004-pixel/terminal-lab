<#
.SYNOPSIS
Gestor de tareas con menu interactivo.
.DESCRIPTION
Menu de cinco opciones que persiste las tareas en un archivo CSV. Las
operaciones viven en el modulo lib/Tareas.psm1.
.PARAMETER Ruta
Ruta al archivo CSV de tareas.
.EXAMPLE
pwsh ./gestor-tareas.ps1
.EXAMPLE
pwsh ./gestor-tareas.ps1 -Ruta datos/otras-tareas.csv
#>

[CmdletBinding()]
param(
    [string]$Ruta = (Join-Path $PSScriptRoot "datos/tareas.csv")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module (Join-Path $PSScriptRoot "lib/tareas.psm1") -Force

# Si el archivo de datos no existe, se crea con su cabecera
if (-not (Test-Path $Ruta)) {
    New-Item -ItemType Directory -Force -Path (Split-Path $Ruta) | Out-Null
    "Id,Descripcion,Estado,Fecha" | Set-Content $Ruta
}

while ($true) {
    Write-Output ""
    Write-Output "  1) Listar   2) Agregar   3) Completar   4) Eliminar   5) Salir"
    $op = Read-Host "Opcion"
    switch ($op) {
        "1" { Get-Tareas -Ruta $Ruta }
        "2" {
            $d = Read-Host "Descripcion"
            Add-Tarea -Descripcion $d -Ruta $Ruta
        }
        "3" {
            $i = Read-Host "Id"
            Set-TareaEstado -Id $i -Estado completada -Ruta $Ruta
        }
        "4" {
            $i = Read-Host "Id"
            Remove-Tarea -Id $i -Ruta $Ruta
        }
        "5" { Write-Output "Hasta luego."; exit 0 }
        default { Write-Warning "Opcion desconocida: $op" }
    }
}
