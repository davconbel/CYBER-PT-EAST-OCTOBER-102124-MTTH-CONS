::Activity 2 Users, Groups, and Password Policies
::Simple example bat file to redirect output and use windows variables

:: Go to the user documents directory
cd C:\Users\%USERNAME%\Documents
::We are going to create a new file for this activity.
::Enumerate users using the net command
net user > reportUsers.txt
::Find the current user password status
net user %USERNAME% >> reportUsers.txt
::Find groups in the machhine
net localgroup >> reportUsers.txt
::Find the current password policy
net accounts >> reportUsers.txt
::Let's check the report
type reportUsers.txt