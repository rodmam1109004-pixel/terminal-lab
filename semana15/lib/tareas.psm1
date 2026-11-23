<#
.SYNOPSIS
Operaciones sobre el archivo de tareas.
.DESCRIPTION
Modulo con las cuatro operaciones del gestor: listar, agregar, cambiar estado
y eliminar. Se carga con Import-Module; no se ejecuta directamente.
Autor: Nombre Apellido
Fecha: 2026-02-15
#>

function Get-Tareas {
    param(
        [string]$Ruta = "datos/tareas.csv"
    )
    try {
        Import-Csv $Ruta -ErrorAction Stop |
            Format-Table -AutoSize | Out-String | Write-Output
    }
    catch {
        Write-Error "No se pudo listar: $($_.Exception.Message)"
    }
}

function Add-Tarea {
    param(
        [Parameter(Mandatory)][string]$Descripcion,
        [string]$Ruta = "datos/tareas.csv"
    )
    try {
        $filas = Import-Csv $Ruta -ErrorAction Stop

        # El Id nuevo es el mayor existente mas uno; contar filas reutilizaria
        # un Id despues de un borrado
        $max = ($filas | Measure-Object Id -Maximum).Maximum
        $id = if ($null -eq $max) { 1 } else { [int]$max + 1 }
        [PSCustomObject]@{
            Id          = $id
            Descripcion = $Descripcion
            Estado      = "pendiente"
            Fecha       = (Get-Date -Format "yyyy-MM-dd")
        } | Export-Csv $Ruta -Append -NoTypeInformation

        Write-Output "Tarea $id agregada."
    }
    catch {
        Write-Error "No se pudo agregar: $($_.Exception.Message)"
    }
}
