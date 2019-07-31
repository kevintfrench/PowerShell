$StrQuit = "0"
Do{
    if((Get-Process -Name wuauclt* -ea SilentlyContinue) -eq $null)
        {
        Sleep -Seconds 5
        } ELSE {
        Stop-Process -ProcessName wuauclt* -Force
        Sleep -Seconds 1
        Stop-Process -ProcessName Windows.Update.application* -Force
        $strQuit = "1"
        }
    }Until($strQuit -eq "1")