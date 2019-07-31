$PSConsoleWindow = (Get-Host).UI.RawUI

$PSConsoleWindow.BackgroundColor = "White"
$PSConsoleWindow.ForegroundColor = "DarkBlue"
$PSCOnsoleWindow.WindowTitle = "Jerry's Customized PowerShell Console Session"

$PSConsoleSize = $PSConsoleWindow.WindowSize

$PSConsoleSize.Width = 80
$PSConsoleSize.Height = 25

$PSConsoleWindow.WindowSize = $PSConsoleSize

Clear-Host
