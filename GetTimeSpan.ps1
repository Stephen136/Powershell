param([DateTime]$start,[DateTime]$end)

$duration = New-TimeSpan -Start $start -End $end
$durationT = $duration.ToString("mm\:ss\.fff")
return $durationT