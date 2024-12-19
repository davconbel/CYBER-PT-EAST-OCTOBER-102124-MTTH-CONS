# Activity 2 Generating Windows Event Log Files with Parameters and Pipelines

#Get 100 events from the Security Windows event log 
Get-WinEvent -LogName Security -MaxEvents 100
# Get the same events but in json format using a pipe
Get-WinEvent -LogName Security -MaxEvents 100 | ConvertTo-Json
#Now tels write the json output to a file in the Logs directory in the root of C:
Get-WinEvent -LogName Security -MaxEvents 100 | ConvertTo-Json | Out-File -FilePath "C:\Logs\RecentSecurityLogs.json"
#Lets check the log output
Get-Content C:\Logs\RecentSecurityLogs.json
#Now lets get the 100 events in json format from the Applications event
Get-WinEvent -LogName Application -MaxEvents 100 | ConvertTo-Json | Out-File -FilePath "C:\Logs\RecentApplicationLogs.json"






