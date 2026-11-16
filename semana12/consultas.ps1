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

function Get-SobreUmbral {
    param([int]$Umbral = 100)
    $datos | Where-Object Valor -gt $Umbral | Select-Object Nombre, Categoria, Valor
}

function Get-ConColumnaCalculada {
    $datos | Select-Object Nombre, Valor, @{
        Name       = 'Doble'
        Expression = { $_.Valor * 2 }
    }
}

Write-Output "=== 1. Filas con Valor mayor que 100 ==="
Get-SobreUmbral | Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== 2. Proyeccion con columna calculada ==="
Get-ConColumnaCalculada | Format-Table -AutoSize | Out-String | Write-Output

function Get-ResumenPorCategoria {
    $datos | Group-Object Categoria | Select-Object `
        @{ Name = 'Categoria'; Expression = { $_.Name } },
        Count,
        @{ Name = 'Total';    Expression = { ($_.Group | Measure-Object Valor -Sum).Sum } },
        @{ Name = 'Promedio'; Expression = { [math]::Round(($_.Group | Measure-Object Valor -Average).Average, 1) } }
}

function Get-DosCondiciones {
    $datos | Where-Object { $_.Valor -gt 50 -and $_.Categoria -eq 'A' }
}

Write-Output "=== 3. Resumen por categoria ==="
Get-ResumenPorCategoria | Sort-Object Categoria |
    Format-Table -AutoSize | Out-String | Write-Output

Write-Output "=== 4. Categoria A con Valor mayor que 50 ==="
Get-DosCondiciones | Format-Table -AutoSize | Out-String | Write-Output
