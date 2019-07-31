$source = "http://alexandria.gmilcs.org/polaris_offline/polsystem.mdb"
$destination = "C:\ProgramData\Polaris\4.1\Offline\polsystem.mdb"

Invoke-WebRequest $source -OutFile $destination