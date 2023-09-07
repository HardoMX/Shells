#Check if Terminal-Icons is installed and import it
if (! (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Write-Host "Module not installed, installing"
    Install-Module Terminal-Icons
}
else {
    Import-Module Terminal-Icons
}


################################
#          Aliases             #
################################
#Better ls commands
function BetterLS {param ($path) Get-ChildItem $path | Format-Wide -AutoSize}
function lsall {param ($path) Get-ChildItem $path -force}
Set-Alias -name ll -value lsall
Set-Alias -name ls -value BetterLS

#Get Public ip
function ip {
    (Invoke-WebRequest http://ifconfig.me/ip).Content
}

#Reload Profile
function rl {
    . $PROFILE
}

#Quickly back up two directories
function cd... {Set-Location .. && Set-Location ..}

#See uptime
function uptime {
    $bootUpTime = Get-WmiObject win32_operatingsystem | Select-Object lastbootuptime
    $plusMinus = $bootUpTime.lastbootuptime.SubString(21,1)
    $plusMinusMinutes = $bootUpTime.lastbootuptime.SubString(22, 3)
    $hourOffset = [int]$plusMinusMinutes/60
    $minuteOffset = 00
    if ($hourOffset -contains '.') { $minuteOffset = [int](60*[decimal]('.' + $hourOffset.ToString().Split('.')[1]))}       
    if ([int]$hourOffset -lt 10 ) { $hourOffset = "0" + $hourOffset + $minuteOffset.ToString().PadLeft(2,'0') } 
    else { $hourOffset = $hourOffset + $minuteOffset.ToString().PadLeft(2,'0') }
    $leftSplit = $bootUpTime.lastbootuptime.Split($plusMinus)[0]
    $upSince = [datetime]::ParseExact(($leftSplit + $plusMinus + $hourOffset), 'yyyyMMddHHmmss.ffffffzzz', $null)
    Get-WmiObject win32_operatingsystem | Select-Object @{LABEL='Machine Name'; EXPRESSION={$_.csname}}, @{LABEL='Last Boot Up Time'; EXPRESSION={$upsince}}
}

if ($IsWindows) {
    #Find a file
    function find ($dir, $name){
        Get-ChildItem $dir -Recurse -Filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
            Write-Output "${_}"
        }
    }

    #Unzip a file into folder with same name (UNTESTED)
    function unzip ($file) {
        $folder = $file -replace ".zip", ""
        mkdir $folder
        $fullFile = Get-ChildItem -Path $pwd -Filter .\cove.zip | ForEach-Object{$_.FullName}
        Expand-Archive -Path $fullFile -DestinationPath $folder
    }

#Grep function
    function grep ($regex, $dir) {
        if ($dir) {
        Get-ChildItem $dir | Select-String $regex
            return
        }
        $input | Select-String $regex
    }

    #Sed function
    function sed($file, $find, $replace) {
        (Get-Content $file).replace("$find", $replace) | Set-Content $file
    }
}

#Kill function
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

#Initialise Oh-My-Posh
Set-Location ~\Documents\GitHub\Shells\PowerShell
oh-my-posh init pwsh --config "../oh-my-posh/tokyo.omp.json" | Invoke-Expression

#Set up functions for quickly changing between my github repositories
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
function Code3 {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Code3}
    elseif ($IsLinux) {
        Set-Location ~/Code3}
    }
function profile {
    if ($IsWindows) {
        Set-Location ~\Documents\PowerShell}
    elseif ($IsLinux) {
        Set-Location ~/.config/powershell}
    }
function Powershell {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Shells\PowerShell}
    elseif ($IsLinux) {
        Set-Location ~/Shells/PowerShell}
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
function bashconf {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Shells\bash}
    elseif ($IsLinux) {
        Set-Location ~/Shells/bash}
    }
function web {
    if ($IsWindows) {
        Set-Location ~\Documents\GitHub\Web}
    elseif ($IsLinux) {
        Set-Location ~/Web}
}

do 
{
    Write-Host "Choose Reposiotry: 1) Code1. 2) Code2. 3) Code3. 4) Profile. 5) PowerShell. 6) Hypr. 7) Nvim. 8) Bash. 9) Web. 10) Home"
    $Repo = Read-Host [Enter Selection]

    Switch ($Repo)
    {
        "1" {Code1}
        "2" {Code2}
        "3" {Code3}
        "4" {profile}
        "5" {Powershell}
        "6" {Hypr}
        "7" {vim}
        "8" {bashconf}
        "9" {web}
        "10" {Set-Location ~}
    }
}until (1..10 -contains $Repo)

Clear-Host


#Set up nvim alias on windows
if ($IsWindows){
    Set-Alias -name nvim -Value nvim.exe
}