001 #
002 # Query own PS Version via: $PSVersionTable.PSVersion --> Required >= V4
003 #
004 # Script start:      powershell -file scriptname /parameter
005 # Script name:       _noRansom.ps1
006 # Function:          Create/compare file list with SHA1 checksums
007 #
008 Clear-Host
009 Write-Output "NoRansom started..."
010
011 # Variable definition with default values     ###########################
012 # "*.log,*.eps"                               Pattern, based on which file extensions to searched for;
013 #                                             see use of Get-ChildItem later on in script in "/create-branch"
014 $StepWidth = 5;#                              Each [stepwidth] file from the set of all files found
015 $FileList = "_noRansom-full.txt";#            Name of output file with ALL files found
016 $MiniFileList = "_noRansom-mini.txt";#        Name of output file with each nth file including SHA1 checksum
017 $ErrorFile = "_noRansom-Error.txt";#          Name of standard error file
018 $AutoWrite = "yes";#                          Defines whether files should be overwritten or canceled (false)
019 $ErrorActionpreference = "silentlycontinue";# No error output on screen
020 # Variable definition with default values     ###########################
021
022 Remove-Item $ErrorFile
023 $error.clear()
024 $ParamFunction = $args[0]
025
026 switch ($ParamFunction)
027  {
028    "/create"
029     {# Create file list with C:\ for the defined file extensions
030       If (Test-Path $FileList)
031        {  if ($AutoWrite -eq "yes")
032           { Remove-Item $FileList }
033          else
034           { $Temp = "The file " + $FileList + " already exists, default is to not overwrite. Please manually delete and call tool again if needed!"
035             write-output $Temp
036             exit 11 }
037        }
038       Get-ChildItem C:\ -recurse -include *.log,*.eps | ForEach { $_.Fullname } > $FileList
039       if ($error)
040        {write-output $error >> $ErrorFile;$error.clear() }
041       $Temp = "File " + $FileList + " created!"
042       write-output $Temp
043       #exit 0
044
045     }
046
047    "/convert"
048     {# Convert and if applicable minimize file list
049
050      # Test whether input file exists for processing
051      if (!(Test-Path $FileList))
052       { $Temp = "The file or file list: " + $FileList + " does not exist. Please first run tool with parameter /create."
053         write-output $Temp
054         exit 11 }
055
056      # Test whether output file exists and if necessary delete
057      If (Test-Path $MiniFileList)
058      {  if ($AutoWrite -eq "yes")
059          { Remove-Item $MiniFileList }
060         else
061          { $Temp = "The file " + $MiniFileList + " [with SHA1 checksum] already exists, default is to not overwrite. Please manually delete and call tool again if needed!"
062            write-output $Temp
063            exit 11 }
064      }
065      $content = Get-Content -Path $FileList
066      $lines = $content.count - 1
067      $Temp = "Lines in input file: " + $lines + " [Convert step width: " + $StepWidth + "]"
068      write-output $Temp
069
070      # Output every nth line including SHA1 checksum
071      $mini=0
072      Remove-Item $MiniFileList
073         for ($i= 0; $i -lt $lines; $i+=$StepWidth)
074         {    $sha1 = ((Get-Filehash $content[$i] -Algorithm SHA1).hash)
075              # Do not output files with access error (no SHA1)
076              if ($sha1)
077              { $Temp = $content[$i] + "," + $sha1
078                Write-Output $Temp >> $MiniFileList
079                $mini++
080              }
081         }
082     $Temp = "Lines in output file (total): " + $mini
083     write-output $Temp
084     exit 0
085     }
086
087    "/compare"
088     {# Compare file list
089      If (!(Test-Path $MiniFileList))
090       { $Temp = "The file " + $MiniFileList + " [with SHA1 checksums] does not exist. Please provide this file first (/create and then /convert)."
091         write-output $Temp
092         exit 11 }
093      $content = Get-Content -Path $MiniFileList
094      $lines = $content.count
095      $splitting = ""; $SHA1OK = 0; $SHA1NOK = 0
096      for ($i= 0; $i -lt $lines; $i+=1)
097      {
098       $Splitting = $content[$i].Split(",")
099       $sha1 = (Get-Filehash $Splitting[0] -Algorithm SHA1).hash
100       if ($error)
101        {write-output $error >> $ErrorFile;$error.clear() }
102
103       if ($sha1 -ne $Splitting[1])
104       {
105        $Temp = "SHA1 checksum deviating for: " + $Splitting[0] + " [Current: " + $sha1 + "  set to: " + $Splitting[1] + "]"
106        write-output $Temp
107        $SHA1NOK +=  1
108       }
109      else
110       { $SHA1OK += 1 }
111      }
112      $Temp =" Verifying SHA1 checksums... OK:" + $SHA1OK + "   NOK:" + $SHA1NOK
113      Write-Output ""
114      Write-Output $Temp
115      if ($SHA1NOK > 0)
116       { exit 11 }
117     }
118
119    default
120    {write-output "Tool Info"
121     write-output " Parameter:"
122     write-output "  /create   Creates a file list for the defined file extensions"
123     write-output "  /convert  computes the SHA1 checksums and reduces the file list (if applicable)"
124     write-output "  /compare  Compares stored checksums with the current actual values"
125     write-output "  "
126     write-output " Start: powershell -file _noRansom.ps1 /parameter"
127     write-output " Exit:  errorlevel 11 on error"
128     write-output " ==> Default tool settings are defined on launching the script."
129     write-output "  " }
130  }