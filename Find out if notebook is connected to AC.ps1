#Ask WMI to find out whether your notebook is connected to AC:

#requires -Version 1

$battery = Get-WmiObject -Class Win32_Battery | Select-Object -First 1
$noAC = $battery -ne $null -and $battery.BatteryStatus -eq 1 

if ($noAC)
{
    'On battery power'
}
else
{
    'Connected to AC'
}
#This code takes into consideration notebooks with multiple batteries (by taking the first it finds) and computers without battery (by checking for a $null result).
