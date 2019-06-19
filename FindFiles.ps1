$filename = '*vv*.*'#you can use wildcards here for name and for extension 
$searchinfolder = 'C:\Users\kfrench\Desktop\images*' 
Get-ChildItem -Path $searchinfolder -Filter $filename -Recurse | %{$_.FullName}