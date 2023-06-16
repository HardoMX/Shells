oh-my-posh init pwsh | Invoke-Expression

if (! (Get-Module -ListAvailable -Name Get-ChildItemColor)) {
    Write-Host "Module not installed, installing"
    Install-Module Get-ChildItemColor
}
else {
    Import-Module Get-ChildItemColor
}

function better_ls {Get-ChildItemColorFormatWide -HideHeader}
Set-Alias -name lsall -value Get-ChildItemColor -option AllScope
Set-Alias -name ls -value better_ls -option AllScope

function Code1 {Set-Location ~\Documents\GitHub\Code}
function Code2 {Set-Location ~\Documents\GitHub\Code2}
function profile {Set-Location ~\Documents\PowerShell}
function Powershell {Set-Location ~\Documents\GitHub\PowerShell}
function Hypr {Set-Location ~\Documents\GitHub\Hyprland-Config}
function vim {Set-Location ~\Documents\GitHub\Nvim-Config}

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

Set-Alias -name stats -Value "~\Documents\GitHub\PowerShell\Scripts\Show-Usage.ps1"
Set-Alias -name make -Value "~\Documents\GitHub\PowerShell\Scripts\make.ps1"
Set-Alias -name nvim -Value nvim.exe
