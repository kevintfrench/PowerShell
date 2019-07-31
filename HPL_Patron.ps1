$source = "http://alexandria.gmilcs.org/polaris_offline/polpatron.mdb"
$destination = "C:\ProgramData\Polaris\4.1\Offline\polpatron.mdb"

Invoke-WebRequest $source -OutFile $destination