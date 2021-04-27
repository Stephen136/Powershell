Function PowerdownVM(){
  param([string]$vmName) 
  Set-Location -Path "C:\Program Files\Oracle\VirtualBox"
  .\VBoxManage controlvm "$vmName" acpipowerbutton
}
