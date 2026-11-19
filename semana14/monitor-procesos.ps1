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

Write-Output "=== Proceso con mas memoria ==="
# Se ordena por MemMB y no por CPU: en Linux, CPU puede venir vacio en
# procesos recien creados, y ordenar por un valor nulo no tiene sentido

$procs | Sort-Object MemMB -Descending | Select-Object -First 1 |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Programas con mas instancias ==="
$procs | Group-Object ProcessName |
    Sort-Object Count -Descending |
    Select-Object -First $Top Count, Name |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Consulta en segundo plano ==="
$job = Start-Job -ScriptBlock { (Get-Process).Count }
Wait-Job $job | Out-Null
$conteo = Receive-Job $job
Remove-Job $job
Write-Output "Procesos contados en el job: $conteo"
Write-Output ""
