#script to run on local machine  
param([String] $vmName = "VBOX VM NAME", [String] $vmID = "32946397-8b5a-4811-bb71-0c91fa499908") #VM UUID 

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/VboxVmRestart.ps1'
    . { iwr -useb  $scriptUrl } | iex; VboxVmRestart -vmName $vmName -vmID $vmID
    
    # Invoke-WebRequest (url) | Invoke-Expression;(VboxVmRestart)_(Args; -vmName $vmName -vmID $vmID)
