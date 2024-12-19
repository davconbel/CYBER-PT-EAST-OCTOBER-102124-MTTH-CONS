::Activity 3 Creating Users and Setting Password Policies
::Simple example bat file to redirect output and use windows variables

:: Go to the user documents directory
cd C:\Users\%USERNAME%\Documents
::Create a new regular user Bob and set the password to Ilovesales123!
net user Bob Ilovesales123! /add
::Create a user, Andrew with the password Ilovedevelopment123!
net user Andrew Ilovedevelopment123! /add
::Add user Andrew to the to the Administrators group
net localgroup administrators Andrew /add
::Verify that Andrew is in the Administrators group
net user Andrew

::To modify password policies it is necessary to use the gpedit command and do it manually.