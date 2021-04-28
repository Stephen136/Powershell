Function VboxVmRestart(){
    param([String] $vmName, [String] $vmID)

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/VboxVmAcpiPowerdown.ps1'
    . { iwr -useb  $scriptUrl } | iex; VboxVmAcpiPowerdown -vmName $vmName

        Start-Sleep -s 10

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/VboxVmStartHeadless.ps1'
    . { iwr -useb  $scriptUrl } | iex; VboxVMStartHeadless -vmID $vmID
}
