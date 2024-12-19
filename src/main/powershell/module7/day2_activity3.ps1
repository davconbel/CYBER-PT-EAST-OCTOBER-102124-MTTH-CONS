# Activity 3 Removing Unnecessary Packages with PowerShell

#Create a variable containing the fields in the csv file with the packages we need to remove.
$csv = Import-Csv -Path .\chocoactivity.csv
#Iterate through the packages and extract the name field to be passed to the uninstall command
  foreach ($package in $csv) {
      choco uninstall -y $package.name
      Write-Output $package.name removed!
  }





