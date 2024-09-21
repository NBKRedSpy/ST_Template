<#
.DESCRIPTION 
    Creates or updates the entry on the Steam Workshop.
    The first run will create the steam workshop item's id in the .vdf.
    The subsequent runs will update.
#>
param(
    [Parameter(Mandatory)]
    [string] $SteamUserName,
    [Parameter(Mandatory)]
    [string] $SteamPassword,
    [Parameter(Mandatory)]
    [string] $SteamGuardCode
)

$VdfPath = dir .\Workshop\workshop.vdf | %{$_.FullName}

copy -Force .\media\thumbnail.png .\Workshop\

steamcmd.exe +login $SteamUserName $SteamPassword $SteamGuardCode +workshop_build_item $VdfPath +quit
