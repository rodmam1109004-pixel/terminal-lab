<#
.SYNOPSIS
Monitorea los procesos en ejecucion y exporta un reporte a CSV.
.DESCRIPTION
Muestra los procesos que mas memoria consumen, cuenta las instancias de cada
programa, ejecuta una consulta en segundo plano y exporta los datos a CSV.
Autor: Nombre Apellido
Fecha: 2026-02-15
Uso: pwsh ./monitor-procesos.ps1 [-Top <n>] [-Salida <archivo>]
#>

[CmdletBinding()]
param(
    [int]$Top = 10,
    [string]$Salida = "procesos.csv"
)

Set-StrictMode -Version Latest

# Una sola consulta al sistema; despues se trabaja sobre esta coleccion
$procs = Get-Process | Select-Object Id, ProcessName, CPU, @{
    Name       = 'MemMB'
    Expression = { [math]::Round($_.WorkingSet64 / 1MB, 1) }
}

Write-Output "=== $Top procesos con mas memoria ==="
$procs | Sort-Object MemMB -Descending | Select-Object -First $Top |
    Format-Table -AutoSize | Out-String | Write-Output
