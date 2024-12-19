::Activity 1 Intro to Task Manager and CMD
::Simple example bat file to redirect output and use windows variables

:: Go to the user documents directory 
cd C:\Users\%USERNAME%\Documents
::Create a file using the echo command and add some headers
echo Baselining Report > report.txt
echo Created by %USERNAME% >> report.txt
::Verify the output
type report.txt
::Add a line containing the machine OS, date a user name
echo %OS% system report created on %DATE% with logged in user, %USERNAME%. >> report.txt
::Verify the output
type report.txt
::List the files contained in Program files 32 and 64 bit
dir "%ProgramFiles%" >> report.txt
dir "%ProgramFiles(x86)%" >> report.txt
::Verify the output
type report.txt