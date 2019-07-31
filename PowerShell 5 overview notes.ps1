##ctrl+space to use intellisense withing the ISE

Get-Command -name *module* -Module PowerShellGet
Get-Command -name get* -Module PowerShellGet

##Author & ISE
Find-Module -name *ISE*
Find-Module -name *ISE* | Where-Object {$_.author -eq "Microsoft Corporation"}

##Dependencies
Save-Module HistoryPX -path "c:\Demo" -Verbose -Force

Install-Module HistoryPX
Get-InstalledModule

##DSC Basics
Get-DscResource xWinEventLog

##Script Analysis - Better Coding
Install-Module PSScriptAnalyzer
Get-Command -Module PSScriptAnalyzer

##First find the PowerShell Get module*
Get-Module -ListAvailable *get*

##Now import the module - tab expansion works for module name
Import-Module PowerShellGet

##now find commands
Get-Command -Module PowerShellGet

## Find* cmdlets: Find-DscResource Find-Module Find-Script 
##Search modules by author
Find-module | ?author -eq 'ed wilson'

##if you know module is in psgallery you can use other properties
Find-Module -Name *azure* | Select version, name, description

##something related to automation with azure*
Find-Module -Name *azure* | ? description -match 'automation' | Select verions, name, description

##automation with runbook that's easier to read
Find-Module -Name *azure* | ? {$_.description -match 'automation' -and $_.description -match 'runbook'} | Select version, name, description | ft -Wrap





Please try again. If problems persist, please contact your Library Administrator.