Set-Location ~\Documents\GitHub\Code

oh-my-posh init pwsh | Invoke-Expression

function Code1 {
    Set-Location ~\Documents\GitHub\Code
}
function Code2 {
    Set-Location ~\Documents\GitHub\Code2
}
function profile {
    Set-Location ~\Documents\PowerShell
}

Set-Alias -name stats -Value "C:\Users\andreas.hard\Documents\GitHub\Code\PowerShell\Used Scripts\Show-Usage.ps1"
Set-Alias -name make -Value "C:\Users\andreas.hard\Documents\GitHub\Code\PowerShell\Used Scripts\make.ps1"