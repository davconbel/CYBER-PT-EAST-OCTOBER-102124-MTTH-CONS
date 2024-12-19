# Activity 1 Creating Domain OUs, Users, and Groups

# Define the domain name
$domainName = "GOODCORP.NET"

# Create top-level GC Users organizational unit for each department's users
$GCUsersOU = "OU=GC Users,DC=GOODCORP,DC=NET"
New-ADOrganizationalUnit -Name "GC Users" -Path "DC=GOODCORP,DC=NET"

# Create Sales sub-OU
$SalesOU = "OU=Sales,OU=GC Users,DC=GOODCORP,DC=NET"
New-ADOrganizationalUnit -Name "Sales" -Path $GCUsersOU

# Create Development sub-OU
$DevelopmentOU = "OU=Development,OU=GC Users,DC=GOODCORP,DC=NET"
New-ADOrganizationalUnit -Name "Development" -Path $GCUsersOU

# Create user, Bob, in the Sales OU
$BobPassword = ConvertTo-SecureString -String "Ilovesales!" -AsPlainText -Force
New-ADUser -Name "Bob" -SamAccountName "Bob" -AccountPassword $BobPassword -Enabled $true -Path $SalesOU

# Create a group, Sales, within the Sales OU
New-ADGroup -Name "Sales" -GroupScope Global -Path $SalesOU

# Add user, Bob, to the group Sales
Add-ADGroupMember -Identity "Sales" -Members "Bob"

# Create user, Andrew, in the Development OU
$AndrewPassword = ConvertTo-SecureString -String "Ilovedev!" -AsPlainText -Force
New-ADUser -Name "Andrew" -SamAccountName "Andrew" -AccountPassword $AndrewPassword -Enabled $true -Path $DevelopmentOU

# Create a group, Development, within the Development OU
New-ADGroup -Name "Development" -GroupScope Global -Path $DevelopmentOU

# Add user, Andrew, to the group Development
Add-ADGroupMember -Identity "Development" -Members "Andrew"

## Create GC Computers OU
$GCComputersOU = "OU=GC Computers,DC=GOODCORP,DC=NET"
New-ADOrganizationalUnit -Name "GC Computers" -Path "DC=GOODCORP,DC=NET"


# Move the Windows 10 machine to the new GC Computers OU
$ComputerName = "DESKTOP-SITPOTH"
$ComputerDN = "CN=$ComputerName,CN=Computers,DC=GOODCORP,DC=NET"
Move-ADObject -Identity $ComputerDN -TargetPath $GCComputersOU

Write-Host "Script Completed!"

