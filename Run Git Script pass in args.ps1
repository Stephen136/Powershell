#script to run on local machine which calls two github scripts#
      
param([String] $vmName = "VBOX VM NAME", [String] $vmID = "32946397-8b5a-4811-bb71-0c91fa499908") #VM UUID 

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/PowerdownVM.ps1' #PATH TO SCRIPT
    . { iwr -useb  $scriptUrl } | iex; PowerdownVM -vmName $vmName
#Invoke-WebRequest (url) ->> Invoke-Expression (URL FUNCTION NAME) (Args; -vmName "VM NAME")

Start-Sleep -s 10

    $scriptUrl = 'https://raw.githubusercontent.com/Stephen136/Powershell/main/StartHeadlessVM.ps1'
    . { iwr -useb  $scriptUrl } | iex; StartHeadlessVM -vmID $vmID
