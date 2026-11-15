<#
.SYNOPSIS
Analisis de un registro de acceso web usando objetos.
.DESCRIPTION
Convierte cada linea de acceso.log en un objeto con propiedades y responde
cuatro preguntas agrupando y filtrando esos objetos.
Autor: Nombre Apellido
Fecha: 2026-02-15
Uso: pwsh ./analizar-datos.ps1 [-Log <ruta>]
#>

param(
    [string]$Log = "acceso.log"
)

Write-Output "=== Analisis de $Log ==="
Write-Output ""

# Cada linea se convierte una sola vez en un objeto con cinco propiedades
$registros = Get-Content $Log | ForEach-Object {
    if ($_ -match '(\S+) .*\[.*?:(\d\d):.*\] "\S+ (\S+) .*?" (\d+) (\d+)') {
        [PSCustomObject]@{
           IP      = $Matches[1]
           Hora    = $Matches[2]
           Recurso = $Matches[3]
           Estado  = [int]$Matches[4]
           Bytes   = [int]$Matches[5]
        }
    }
}

Write-Output "Registros leidos: $($registros.Count)"
Write-Output ""

Write-Output "=== Top 5 IP con mas peticiones ==="
$registros |
    Group-Object IP |
    Sort-Object Count -Descending |
    Select-Object -First 5 Count, Name |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Conteo por codigo de estado ==="
$registros |
    Group-Object Estado |
    Sort-Object Name |
    Select-Object Name, Count |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Peticiones con error 500 ==="
$registros |
    Where-Object Estado -eq 500 |
    Select-Object Hora, IP, Recurso |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Hora pico ==="
$registros |
    Group-Object Hora |
    Sort-Object Count -Descending |
    Select-Object -First 1 Name, Count |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== Trafico total ==="
$suma = ($registros | Measure-Object Bytes -Sum).Sum
$promedio = [math]::Round(($registros | Measure-Object Bytes -Average).Average, 1)
Write-Output "Bytes enviados: $suma"
Write-Output "Promedio por peticion: $promedio"
Write-Output ""
Write-Output "Analisis completado."
