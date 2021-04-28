$arrVMs = New-Object 'object[,]' 10,20
$lstVM = New-Object System.Collections.Generic.List[System.Object]
$lstVMId = New-Object System.Collections.Generic.List[System.Object]
$lstVMMac = New-Object System.Collections.Generic.List[System.Object]
#-------------------------------------------------------------------------
$arrVMs = & 'C:\program files\oracle\virtualbox\VBoxManage.exe' list vms
$x = 0

    foreach ($vm in $arrVMs){
        #Trim VM
        $vmName = $vm.split('"')[1]
        $lstVM.Add($vmName.Trim())
        
        #Trim VM Id
        $vmId = $vm.split('{')[1]
        $vmId = $vmId.Substring(0,$vmId.Length - 1)
        $lstVMId.Add($vmId.Trim())

        #Get Mac Address
        $arrVmInfo = @(& 'C:\program files\oracle\virtualbox\VBoxManage.exe' showvminfo $vmId.Trim())

            foreach ($var in $arrVmInfo){
                if($var -like "*NIC 1*"){
                    $mac = $var
                }
            }

        $macAdd = $mac.Substring(34,12)
        $mac = $macAdd.Insert(2,':')
        $mac = $mac.Insert(5,':')
        $mac = $mac.Insert(8,':')
        $mac = $mac.Insert(11,':')
        $mac = $mac.Insert(14,':')

        $lstVMMac.Add($mac)
    }

Clear-Host
Write-host "`n`n`n**********************************  Virtual Machines  *******************************************`n`n"
Write-Host "VM UUID`t`t`t`t`t`t`t`tMAC`t`t`t`tNAME`n"

    foreach ($var in $lstVM) {
        Write-Host "$($lstVMId[$x])`t-`t$($lstVMMac[$x])`t-`t$($var)"
        $x++
    }

Write-host "`n`n`n*************************************************************************************************`n`n`n"
