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
function Set-TareaEstado {
    param(
        [Parameter(Mandatory)][int]$Id,
        [Parameter(Mandatory)]
        [ValidateSet("pendiente", "completada", "cancelada")]
        [string]$Estado,
        [string]$Ruta = "datos/tareas.csv"
    )
    try {
        $tareas = Import-Csv $Ruta -ErrorAction Stop
        $fila = $tareas | Where-Object Id -eq $Id
        if (-not $fila) { throw "No existe ninguna tarea con Id=$Id" }

        $fila.Estado = $Estado
        $tareas | Export-Csv $Ruta -NoTypeInformation
        Write-Output "Tarea $Id marcada como $Estado."
    }
    catch {
        Write-Error "No se pudo cambiar el estado: $($_.Exception.Message)"
    }
}

function Remove-Tarea {
    param(
        [Parameter(Mandatory)][int]$Id,
        [string]$Ruta = "datos/tareas.csv"
    )
    try {
        $tareas = Import-Csv $Ruta -ErrorAction Stop
        if (-not ($tareas | Where-Object Id -eq $Id)) {
            throw "No existe ninguna tarea con Id=$Id"
        }
        $tareas | Where-Object Id -ne $Id | Export-Csv $Ruta -NoTypeInformation
        Write-Output "Tarea $Id eliminada."
    }
    catch {
        Write-Error "No se pudo eliminar: $($_.Exception.Message)"
    }
}

Export-ModuleMember -Function Get-Tareas, Add-Tarea, Set-TareaEstado, Remove-Tarea
