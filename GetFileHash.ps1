Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -AssemblyName Microsoft.VisualBasic

#----------------------------------------------------------------------------------------------

Do
{
    $title = "Hash a file"
    $prompt = "Enter your full file path:"
    $input = [Microsoft.VisualBasic.Interaction]::InputBox($prompt, $title) 
        if($input -eq ""){exit}
    $input = $input.replace("""","")

    $src = Get-ChildItem -Recurse -path $input
    $fileSize = [math]::round($src.length/1MB,3) 

    $title = "Choose hashing algorithm"
    $prompt = "`nMD5  SHA256  SHA512"
    $default = "MD5"
    $input2 = [Microsoft.VisualBasic.Interaction]::InputBox($prompt, $title, $default)
        if($input2 -eq ""){exit}
    $input2 = $input2.ToUpper();
    
    $start = &"D:\OneDrive - Blackburn College\Code\PS1\FileHash\GetTheDate.ps1" 
    
        switch ($input2)
        {
            "MD5" {
                $hash =  Get-FileHash -Algorithm MD5 -Path $input
            }
            "SHA256" {
                $hash =  Get-FileHash -Algorithm SHA256 -Path $input
            }
            "SHA512" {
                $hash =  Get-FileHash -Algorithm SHA512 -Path $input
            }
        Default 
        {exit} #If anything other than above strings
        }

    $end = & "D:\OneDrive - Blackburn College\Code\PS1\FileHash\GetTheDate.ps1"
    $duration = & "D:\OneDrive - Blackburn College\Code\PS1\FileHash\GetTimeSpan.ps1" $start $end

    $title = "        $($hash.Algorithm) Hash"
    $button = [System.Windows.MessageBoxButton]::YesNo
    $icon = [System.Windows.MessageBoxImage]::information

    $prompt = "`File Path:`r$($hash.Path)`r`rFile Size:`t`t$fileSize MB`r`rAlgorithm:" + 
    "`t$($hash.Algorithm)`r`r$($hash.Hash)`r`rTime Taken:`t$duration`r" + 
    "(captured to clipboard)`r`rHash another file?"

    $($hash.Hash) | clip

    $result = [System.Windows.MessageBox]::Show($prompt,$title,$button,$icon)
    Write-Host "Path:`t$($hash.Path)"
    Write-Host "Algorithm:`t$($hash.Algorithm)"
    Write-Host "Hash:`t$($hash.Hash)"
    Write-Host "Time Taken:`t$durationT"
    write-host "Hash another file:`t$result"
}while($result -eq "YES")

#----------------------------------------------------------------------------------------------

# only stays in memory when powershell is running

    #$start = Invoke-Command -ScriptBlock ${function:..\myTimeF}
    #$end = Invoke-Command -ScriptBlock ${function:..\myTimeF} 
    #$duration = Invoke-Command -ScriptBlock ${function:..\GetTimeSpan}

function myTimeF{
    return Get-Date
}

function GetTimeSpan{
    $duration = New-TimeSpan -Start $start -End $end
    $durationT = $duration.ToString("mm\:ss\.ffffff")
    return $durationT
}


