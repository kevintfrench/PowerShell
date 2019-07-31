invoke-command { 
$members = net localgroup administrators | 
where {$_ -AND $_ -notmatch "command completed successfully"} | 
select -skip 4 
New-Object PSObject -Property @{ 
Computername = $env:COMPUTERNAME 
Group = "Administrators" 
Members=$members 
} 
} -computer fs1,sp01,ncnad -HideComputerName | 
Select * -ExcludeProperty RunspaceID | Export-CSV c:\data\local_admins.csv -NoTypeInformation 