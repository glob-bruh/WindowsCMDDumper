
# WINDOWS POWERSHELL DUMPER

Write-Output "******************************************************************"
Write-Output "* Windows Powershell Dumper                                      *"
Write-Output "* By: GlobBruh                                                   *"
Write-Output "*                                                                *"
Write-Output "* Instructions available in the README.md file or on GitHub.     *"
Write-Output "*                                                                *"
Write-Output "* https://github.com/glob-bruh/WindowsCMDDumper                  *"
Write-Output "******************************************************************"

Write-Output "Preperation..."
Set-Location C:\Users\vboxuser\Documents\
New-Item -Name "GlobBruhDUMP" -ItemType "directory"

Get-ChildItem -Recurse \ | Out-File -FilePath .\GlobBruhDUMP\Files.txt

# REGISTRY:

Get-Process -IncludeUserName | Out-File -FilePath .\GlobBruhDUMP\Processes.txt

Get-NetIPAddress | Out-File -FilePath .\GlobBruhDUMP\netstat.txt
Get-NetTCPConnection| Add-Content -Path .\GlobBruhDUMP\netstat.txt

Write-Output "Compress Folder..."
Compress-Archive .\GlobBruhDUMP\ .\GLOBBRUH-DUMP.zip