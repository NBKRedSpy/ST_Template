# Changes the current directory to the path that the specified file is located at.
# Useful for programs that have a "copy file path to clipboard", but not a "directory only" option.
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
