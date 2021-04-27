Function StartHeadlessVM(){
    param([String] $vmName, [String] $vmID)

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/PowerdownVM.ps1'
    . { iwr -useb  $scriptUrl } | iex; PowerdownVM -vmName $vmName

    Start-Sleep -s 10

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/StartHeadlessVM.ps1'
    . { iwr -useb  $scriptUrl } | iex; StartHeadlessVM -vmID $vmID
}
