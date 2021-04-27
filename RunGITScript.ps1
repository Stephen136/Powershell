$ScriptFromGithHub = Invoke-WebRequest "https://raw.githubusercontent.com/Stephen136/Powershell/main/GetFileHash.ps1" -UseBasicParsing
Invoke-Expression $($ScriptFromGithHub.Content)
