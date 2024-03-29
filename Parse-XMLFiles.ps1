#===================================================================================================== 
# Powershell -- Created with PowerGUI by Dell
# NAME:  	Parse-XMLFiles.ps1
# AUTHOR: 	Ben Bishop
# DATE  : 	29-05-2017
# Version : 1.0.0.0      
# COMMENT: 	Script to search through XML files in one location, then based on specific words will
# 			move the files into a new location
# 
# Requirement:
# Windows Powershell V1.0
#===================================================================================================== 



CLS	#Clear the screen


$CurrentLoc = "E:\My Work\Test\Old Loc"			#Set the location of the folder to be checked
$NewLoc = "E:\My Work\Test\New Loc"				#Set the location of the folder to place the files into if found to hold the keywords.
$QueryWords = @(								#Add the words you wish to query
	"eggs","Marigold","bacon"
)

Write-Host "===Start Script==="

#Check that both locations actually exist before running the command
If(!(Test-Path $Currentloc))
{
	Write-Warning "$CurrentLoc does not exist! Exiting powershell"
	Write-Host "===End Script==="
	pause
	Exit	#Exit the script if it does not exist
}

If(!(Test-Path $Newloc))
{
	Write-Warning "$NewLoc does not exist! Exiting powershell"
	Write-Host "===End Script==="
	pause
	Exit	#Exit the script if it does not exist
}

Write-Host "Searching for words $QueryWords"

$Filesmoved = [int]0

ForEach($file in gci $CurrentLoc)
{
	$continue = [Boolean]$true
	
	if($file -like "*.xml") #Check the file to be tested is an XML
	{
		$filepath = ($currentloc + "\" +$file) #Set the filepath of the file
		
		ForEach($line in gc $filepath) #Check each line of the XML
		{ 
		
			
			ForEach($Query in $QueryWords) #Check each query in the list
			{ 
			
				If($line -like "*$query*" -and $continue -eq $true) #If the query is present in the line and has not already been found, process the file
				{
					
					
					$Filesmoved += 1 #Add 1 to the total number of files moved
					
					#Write to host the line and the file found to be affected
					Write-Host "Found query" -NoNewline 
					write-host $line -ForegroundColor Green -NoNewline
					write-host " in " -ForegroundColor white -NoNewline
					write-host $filepath -ForegroundColor green
					
					Move-Item $filepath $newloc -Force #Move the item over
					
					$continue = $false #Stop any further checks of the file seeing as it has been processed
				}
			}
		}	
	}
}
Write-Host "Moved $FilesMoved file(s)"
Write-Host "===End Script==="
pause