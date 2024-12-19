#Activity 1 Move and Create Directories

# Go to the user Documents directory 
Set-Location $env:USERPROFILE\Documents
#Move directory contracts to the root of C: drive
Move-Item contracts C:\
#List the contents of the C:\ drive
Get-ChildItem C:\
#Move to the root of the C: directory as the new work directory
Set-Location C:\
#Create Backups, Logs, and Scripts directories
New-Item "Logs", "Backups", "Scripts" -ItemType "Directory" -Force
#List the contents of the C:\ drive
Get-ChildItem C:\
#Rename contracts to Contracts, because Windows is not case sensitive we need to run the command twice.
Rename-Item contracts contracts1
Rename-Item contracts1 Contracts






