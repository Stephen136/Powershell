Function VboxVmStartHeadless(){
  param([string]$vmID)
  $vmIDstr = "--startvm $vmID"
  start-process 'C:\program files\oracle\virtualbox\vboxheadless' $vmIDstr -WindowStyle Hidden
}
