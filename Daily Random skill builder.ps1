Get-Command -Module Microsoft*,Cim*,PS*,ISE | Get-Random | Get-Help -ShowWindow

<#pulls a cmdlet at random from "the core, out-of-the-box PowerShell, and displays the help for that cmdlet in a popup window#>

Get-Random -input (Get-Help about*) | Get-Help -ShowWindow

<#pulls a concept  at random from "the core, out-of-the-box PowerShell, and displays the help for that concept in a popup window#>