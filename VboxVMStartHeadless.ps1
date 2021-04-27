Function VboxVMStartHeadless(){
  param([string]$vmID)
  $vmIDstr = "--startvm $vmID"
  start-process 'C:\program files\oracle\virtualbox\vboxheadless' $vmIDstr -WindowStyle Hidden
}
