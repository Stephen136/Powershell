<############################################################################

*    This code will close running Virtual Machines in VirtualBox
*    relies on 'Vbox.vdi' being same name as 'Vbox Machine' name.

######################    Written by Stephen Aspden    ######################>

#ignoring some minor errors with substring on uneeded data in the array
$ErrorActionPreference = 'SilentlyContinue'

$arrVmHDDs = New-Object 'object[,]' 10,20
$lstVmName = New-Object System.Collections.Generic.List[System.Object]
$lstVmState = New-Object System.Collections.Generic.List[System.Object]
$arrVmHDDs = & 'C:\program files\oracle\virtualbox\VBoxManage.exe' list hdds

<#
#FOR DEBUGGING - (tuseful to extract vm info)
foreach ($hdd in $arrVmHDDs) {
    Write-Host $hdd
}
exit
#>

foreach ($hdd in $arrVmHDDs) {

    #VM Name from Location
    $split = $hdd.substring(0,9)
        if($split -eq 'Location:') {
            #split .vdi name after 3rd slash (0,1,2) --- "D:\VMs\Rockyou SQL\Rockyou SQL.vdi"
            $vm = $hdd.split('\')[2]
            $vm = $vm.split('.')[0]
            $lstVmName.Add($vm.Trim())
        }

    #State
    $split = $hdd.substring(0,6)
        if($split -eq 'State:') {
            $state = $hdd.Substring(8,15)
            $text = (Get-Culture).TextInfo
            $state = $text.ToTitleCase($state.Trim())
            $lstVmState.Add($state)
        }
}
$x = 0
$y = 0
Clear-Host

Write-Host "################ ACPI Powerdown of running Virtual Machines ################" `n`n

foreach($v in $lstVmState) {
    if($v -ilike "*Locked*") {
        & "D:\OneDrive - Blackburn College\Code\Virtual Machine\VM Stop.ps1" $lstVmName[$x]
        Write-Host "`tPowering down VM:`t$($lstVmName[$x])"
        Start-Sleep -s 1
        $y++
    }
$x++
}

if($y -eq 0){
    Write-Host "No current running VMs`n`n`n"
}
