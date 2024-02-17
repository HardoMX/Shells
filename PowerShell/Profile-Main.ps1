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
oh-my-posh init pwsh --config "../oh-my-posh/theme.omp.json" | Invoke-Expression

#Set up functions for quickly changing between github repositories in Windows
if ($IsWindows) {
    $repoDir = "~\Documents\GitHub"
    $repoAmmount = (Get-ChildItem -Path $repoDir | Measure-Object).Count
    $repos = @()
    $repoNames = @()

    for ($i = 0; $i -lt $repoAmmount; $i++) {
        $repoName = (Get-ChildItem -Path $repoDir | Select-Object -Index $i).Name
        $repos += "$repoDir\$repoName"
        $repoNames += "$repoName"
    }

    $repos += "~\Documents\PowerShell"
    $repoNames += "Profile"
    $repos += "~"
    $repoNames += "Home"

    do
    {
        Write-Host "Choose Repository: "
        for ($i = 0; $i -lt $repoAmmount + 2; $i++) {
            Write-Host ($i + 1) ")" $repoNames[$i]
        }
        $Repo = [int](Read-Host [Enter Selection])

        Set-Location -Path $repos[$Repo - 1]

    }until (1..($repoAmmount + 2) -contains $Repo)
}