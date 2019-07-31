$source = "http://alexandria.gmilcs.org/polaris_offline/polsystem.mdb"

$destination = "C:\Users\Kevin\Downloads"
Invoke-WebRequest $source -OutFile $destination
