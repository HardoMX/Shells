[int]$CPU = (Get-Counter -Counter "\Processor(_total)\% Processor Time").CounterSamples.CookedValue

$DiskRoot = (Get-PSDrive C).Root
$DiskFree = (Get-PSDrive C).Free
$DiskUsed = (Get-PSDrive C).Used

$UsedRAM = (Get-Counter -Counter "\Memory\Committed Bytes").CounterSamples.CookedValue
$FreeRAM = (Get-Counter -Counter "\Memory\Available Bytes").CounterSamples.CookedValue


$DiskFree = [int]($DiskFree/1000000000)
$DiskUsed = [int]($DiskUsed/1000000000)
$DiskTotal = $DiskFree + $DiskUsed

$UsedRAM = [int]($UsedRam/1000000000)
$FreeRAM = [int]($FreeRam/1000000000)
$TotalRAM = $UsedRAM + $FreeRAM


Write-Host "CPU Usage: " -ForegroundColor Blue -NoNewline
Write-Host "$CPU% (%?)"

Write-Host "Total RAM: " -ForegroundColor Blue -NoNewline
Write-Host "$($TotalRAM)GB" 
Write-Host "   Used: " -ForegroundColor Red -NoNewline
Write-Host "$($UsedRAM)GB"
Write-Host "   Free: " -ForegroundColor Cyan -NoNewline
Write-Host "$($FreeRAM)GB"

Write-Host "Total Disk Space: " -ForegroundColor Blue -NoNewline
Write-Host "$($DiskTotal)GB"
Write-Host "   Used: " -ForegroundColor Red -NoNewline
Write-Host "$($DiskUsed)GB"
Write-Host "   Free: " -ForegroundColor Cyan -NoNewline
Write-Host "$($DiskFree)GB" 
Write-Host "   Disk Root: " -ForegroundColor DarkCyan -NoNewline
Write-Host "$DiskRoot"