﻿#This can either be run locally or part of a larger script to hit multiple machines.

$Drive=Get-WmiObject Win32_LogicalDisk -Filter "DriveType = 3" 
$DriveSize=$Drive.Size;$DriveSize=[math]::Round($DriveSize/1GB) 
$FreeSpace=$Drive.FreeSpace;$FreeSpace=[math]::Round($FreeSpace/1GB) 
$DriveName=$Drive.Name 
$ComputerName=Get-WmiObject Win32_ComputerSystem;$ComputerName=$ComputerName.Name 
$UsedSpace=$DriveSize - $FreeSpace;$UsedSpace=[string]$UsedSpace+" GB free on drive $DriveName on computer $ComputerName"