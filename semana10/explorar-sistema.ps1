<#
.SYNOPSIS
Explorador del sistema escrito en PowerShell.
.DESCRIPTION
Recorre seis directorios de la jerarquia del sistema y muestra, para cada uno,
su funcion y un listado de su contenido.
Autor: Nombre Apellido
Fecha: 2026-02-15
Uso: pwsh ./explorar-sistema.ps1
#>

Write-Output "Exploracion del sistema - PowerShell"
Write-Output ""

function Get-DirInfo {
    param(
        [string]$Path,
        [int]$Max = 10
    )
    # Devuelve objetos, no texto: el formato se aplica despues
    Get-ChildItem -LiteralPath $Path -ErrorAction SilentlyContinue |
        Select-Object -First $Max Name, Length, LastWriteTime
}

function Show-Seccion {
    param(
        [string]$Path,
        [string]$Desc
    )
    Write-Output "=== $Path ==="
    Write-Output $Desc
    Get-DirInfo -Path $Path | Format-Table -AutoSize | Out-String | Write-Output
    Write-Output ("-" * 50)
    Write-Output ""
}

Show-Seccion -Path "/etc" -Desc "/etc guarda la configuracion del sistema en texto plano."
Show-Seccion -Path "/var" -Desc "/var guarda datos que cambian: registros, colas y caches."
Show-Seccion -Path "/home" -Desc "/home contiene un subdirectorio por usuario."
Show-Seccion -Path "/bin" -Desc "/bin contiene los programas esenciales del sistema."
Show-Seccion -Path "/tmp" -Desc "/tmp contiene archivos temporales que se borran al reiniciar."
Show-Seccion -Path "/proc" -Desc "/proc es virtual: el kernel genera su contenido al leerlo."
Write-Output "Exploracion completada."
