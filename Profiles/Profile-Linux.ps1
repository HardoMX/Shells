oh-my-posh init pwsh | Invoke-Expression

function Code1 {Set-Location ~/Code}
function Code2 {Set-Location ~/Code2}
function profile {Set-Location ~/.config/powershell}
function Powershell {Set-Location ~/PowerShell}
function Hypr {Set-Location ~/Hyprland-Config}
function vim {Set-Location ~/.config/nvim}

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

Set-Alias -name make -Value "~\Documents\GitHub\PowerShell\Scripts\make.ps1"
