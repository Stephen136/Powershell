param([String] $vmName, [String] $vmID)

    & "D:\Code\PS1\Control VMs\VM Stop.ps1" "$vmName"

Start-Sleep -s 15

    & "D:\Code\PS1\Control VMs\VM Start Headless.ps1" "$vmID"