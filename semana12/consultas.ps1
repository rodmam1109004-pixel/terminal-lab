<#
.SYNOPSIS
Seis consultas sobre datos.csv.
.DESCRIPTION
Filtra, proyecta, agrupa y agrega usando Where-Object, Select-Object,
Sort-Object, Group-Object y Measure-Object.
Autor: Nombre Apellido
Fecha: 2026-02-15
Uso: pwsh ./consultas.ps1 [-Csv <ruta>]
#>

param(
    [string]$Csv = "./datos.csv"
)

# Import-Csv devuelve todo como texto: Valor se convierte a entero al importar
$datos = Import-Csv $Csv | ForEach-Object {
    $_.Valor = [int]$_.Valor
    $_
}

Write-Output "=== Consultas sobre $Csv ==="
Write-Output "Filas leídas: $($datos.Count)"
Write-Output ""
