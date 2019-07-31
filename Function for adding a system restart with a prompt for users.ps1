[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic")
Function RestartPrompt { 
$Prompt1 = [Microsoft.VisualBasic.Interaction]::MsgBox("IT is rebooting your machine. Please save and close any open work, if you wish to cancel the reboot please hit cancel.", "OKCancel,Information","IT")
if ($Prompt1 -eq "Ok") { 
[Microsoft.VisualBasic.Interaction]::MsgBox("Reboot will occur in 5 minutes.", "OkOnly,Information","IT") 
shutdown /r /t 300 
}
if ($Prompt1 -eq "Cancel") { 
[Microsoft.VisualBasic.Interaction]::MsgBox("Reboot has been canceled.", "OKOnly,Information","IT") 
break 
} 
}
RestartPrompt