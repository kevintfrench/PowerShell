##This works on Windows Server 2008R2+ and needs the Windows Server Backup feature installed along with the command line tools. I believe the command line tools comes as part of the feature in Server 2012.
##You can set up the use of SSL and credentials if you choose to as well.
$Date=Get-Date; $Date=$Date.AddDays(-1).ToShortDateString() 
$WBS=Get-WBSummary 
$LastBackupResult=$WBS.LastBackupResultDetailedHR 
$LastSuccessfulBackup=$WBS.LastSuccessfulBackupTime.ToShortDateString() 
$LastBackup=$WBS.LastBackupTime 
$Versions=$WBS.NumberOfVersions 
$ErrorDesc=Get-WBJob -Previous 1; $ErrorDesc=$ErrorDesc.ErrorDescription
$SuccessfulBackupBody=@" 
Date: $LastSuccessfulBackup 
Backups Available: $Versions 
"@
$FailedBackupBody=@" 
Last Backup: Failed 
Date: $LastBackup 
Reason: $ErrorDesc 
"@
$RecurringFailedBackupBody=@" 
Last Backup: Failed 
Date: $LastBackup 
Last Successful Backup: $LastSuccessfulBackup 
Reason: $ErrorDesc 
"@
if($LastBackupResult -eq 0){ 
Send-MailMessage -To "recepient@email.com" -From "sender@email.com" -Subject "Backup Successful - $ENV:COMPUTERNAME" -Body $SuccessfulBackupBody -SmtpServer YourSMTPServer 
} 
elseif($LastBackupResult -ne 0 -or $LastSuccessfulBackup -lt $Date){ 
if($LastSuccessfulBackupTime -lt $Date){ 
Send-MailMessage -To "recepient@email.com" -From "sender@email.com" -Subject "Backup Failed - $ENV:COMPUTERNAME" -Body $RecurringFailedBackupBody -SmtpServer YourSMTPServer 
} 
else{ 
Send-MailMessage -To "recepient@email.com" -From "sender@email.com" -Subject "Backup Failed - $ENV:COMPUTERNAME" -Body $FailedBackupBody -SmtpServer YourSMTPServer 
} 
}