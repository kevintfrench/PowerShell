Param (
    $subnet = "10.10.1."
    $start =10
    $end = 20
    )
$start..$end | where { test-connection "$subnet$_" -count 1 -Quiet } |
foreach { "$subnet$_" }
