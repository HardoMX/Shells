oh-my-posh init pwsh --config "~/Documents/GitHub/PowerShell/Profiles/theme.omp.json" | Invoke-Expression


if (! (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Write-Host "Module not installed, installing"
    Install-Module Terminal-Icons
}
else {
    Import-Module Terminal-Icons
}


function BetterLS {param ($path) Get-ChildItem $path | Format-Wide -AutoSize}
function lsall {param ($path) Get-ChildItem $path -force}
Set-Alias -name ll -value lsall
Set-Alias -name ls -value BetterLS


function Code1 {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Code}
    elseif ($IsLinux) {
        Set-Location ~/Code}
    }
function Code2 {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Code2}
    elseif ($IsLinux) {
        Set-Location ~/Code2}
    }
function profile {
    if ($IsWindows) {
        Set-Location ~\Documents\PowerShell}
    elseif ($IsLinux) {
        Set-Location ~/.config/powershell}
    }
function Powershell {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\PowerShell}
    elseif ($IsLinux) {
        Set-Location ~/PowerShell}
    }
function Hypr {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Hyprland-Config}
    elseif ($IsLinux) {
        Set-Location ~/Hyprland-Config}
    }
function vim {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\nvim}
    elseif ($IsLinux) {
        Set-Location ~/.config/nvim}
    }

do 
{
    Write-Host "Choose Reposiotry: 1) Code1. 2) Code2. 3) Profile. 4) PowerShell. 5) Hypr. 6) Nvim"
    $Repo = Read-Host [Enter Selection]

    Switch ($Repo)
    {
        "1" {Code1}
        "2" {Code2}
        "3" {profile}
        "4" {Powershell}
        "5" {Hypr}
        "6" {vim}
    }
}until (1..6 -contains $Repo)

Clear-Host


function stats {
    if ($IsWindows) {
        "~\Documents\GitHub\PowerShell\Scripts\Show-Usage.ps1"}
    elseif ($IsLinux) {
        "~/PowerShell/Scripts/Show-Usage.ps1"}
    }

Set-Alias -name stats -Value stats

if ($IsWindows){
    Set-Alias -name nvim -Value nvim.exe
}
