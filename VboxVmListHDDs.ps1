#ignoring some minor errors with substring on uneeded data in the array
$ErrorActionPreference = 'SilentlyContinue'

$arrVmHDDs = New-Object 'object[,]' 10,20
$lstVmHDD = New-Object System.Collections.Generic.List[System.Object]
$lstVmName = New-Object System.Collections.Generic.List[System.Object]
$lstVmState = New-Object System.Collections.Generic.List[System.Object]
#-------------------------------------------------------------------------

$arrVmHDDs = & 'C:\program files\oracle\virtualbox\VBoxManage.exe' list hdds


foreach ($hdd in $arrVmHDDs){

write-host $hdd
}

    foreach ($hdd in $arrVmHDDs) {
        #Trim UUID
        $split = $hdd.substring(0,5)
            if($split -eq 'UUID:'){
                $vmUUID = $hdd.Substring(8,44)
                $lstVmHDD.Add($vmUUID.Trim())
            }

        #Trim Location
        $split = $hdd.substring(0,9)
            if($split -eq 'Location:'){
                $loc = $hdd.split('\')[2]
                $loc = $loc.split('.')[0]
                $lstVmName.Add($loc.Trim())
            }

        #Trim State
        $split = $hdd.substring(0,6)
            if($split -eq 'State:'){
                $state = $hdd.Substring(8,15)
                $text = (Get-Culture).TextInfo
                $state = $text.ToTitleCase($state.Trim())
                $lstVmState.Add($state)
                Write-Host $state
            }
    }
$x = 0

Clear-Host

$x = 0

Write-host "`n`n`n***********************  Virtual Machine Disks  ********************************`n`n"
Write-Host "VM HDD UUID`t`t`t`t`t`t`t`t`tSTATE`t`tNAME`n"

    foreach ($var in $lstVmName) {
        Write-Host "$($lstVmHDD[$x])`t-`t$($lstVmState[$x])`t-`t$($var)"
        $x++
    }

Write-Host `n`n`n
