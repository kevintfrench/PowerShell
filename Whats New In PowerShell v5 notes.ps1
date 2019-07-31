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

Find-Module -Name AzureAutomationAuthoringToolkit | Install-Module -Scope CurrentUser

##without the current user bit there was an error about untrusted repository so change that by
Get-PSRepository

##Per user repository registration
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted 

##Execution policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned

##Better?
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy AllSigned -Force

##PowerShell Security
##https://blogs.msdn.microsoft.com/powershell/2015/06/09/powershell-the-blue-team/
##region1
$transcript Start-Transcript -OutputDirectory C:\temp\Transcripts -IncludeInvocationHeader

Get-Process -Name Power*
Get-Service m*

##now stop transcript
$transcript = Stop-Transcript
$transcript
ise $transcript.Path
## end region 1
##region 2
gpedit.msc

Get-Module *pssecurity*


Import-Module .\PSSecurity.psm1

Remove-Item C:\temp\Transcripts\* -Recurse
Enable-PSTranscription -IncludeInvocationHeader -OutputDirectory C:\temp\Transcripts

##end region 2
##Script block logging
powershell -noprofile {Invoke-Expression 'Get-Process -Name Power*'} | Sort -Descending Id

##Antimal   ware scan
##Debugging
##generate error
function Show-Error {Get-Item c:\doesNotExist.txt}
Show-Error
##Change error reporting color to make it easier to read
$psISE.Options.ErrorForegroundColor = [System.Windows.Media.Colors]::Chartreuse
Show-Error
##Articulate the problem to someone as it often exposes the solution just by saying it out loud.
##How to make it less overwhelming (prioritize and actionable)
$Error
    | Group-Object
    | Sort-Object -Property Count -Descending
    | Format-Table -Property Count, Name -AutoSize
#What about specific error details?
$Error[0] | fl * -Force
#When the top level information isn't clear, go deep
$Error[0].Exception
$Error[0].Exception | fl * -Force
$Error[0].Exception.InnerException | fl * -Force
#Clean up behind yourself as you deal with errors
$Error.Remove($Error[0]) #remove specific error
$Error.RemoveAt(0) #Remove by index
$Error.RemoveRange(0,10) #Remove by index + count
$Error.Clear() #Clear teh Error collection
#An important note about error handling: use try/catch to insure terminating
#Break running scripts
#Use Ctrl+B to break into a running script at any time
#use Wait-Debugger for long scripts where you think one line might be a problem
#remember to Set-ExecutionPolicy -Scope Process -ExecutionPolicy AllSigned
$jobs
Debug-job -job $jobs[0]
#Kirk Munroe did the above
#June Blender below on Classes

quser

##Just enough administration JEA 


sfc /scannow


##Desired State Configuration DSC
Get-dsclocalconfigurationmanager
##LCM is Local configuration manager which dsc is part of

##Invoke-DscResource
Get-Command Invoke-DscResource -Syntax

##Calling a basic resource
Invoke-DscResource -Name Service -ModuleName PSDesiredStateConfiguration
    -Method Test -Property @{ Name = 'BITS'; State = 'Running' }

## The Gotcha - the File resource
Get-DscResource | select -first 5

$MVASampleDir = " $env:ProgramFiles/WindowsPowerShell/Modules/MVASample"
##Set up a module to work with 
mkdir $MVASampleDir -Force 
##Ctrl <space> help sense


















