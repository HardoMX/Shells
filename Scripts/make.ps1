param(
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")] [array] $Paths
)

$Name = $Paths[0] -replace 'cpp|c\+\+|cxx', 'exe'

$command = "g++ -o $Name $Paths"

Invoke-Expression $command