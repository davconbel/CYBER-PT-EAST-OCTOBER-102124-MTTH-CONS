#!/bin/bash
#Activity 4: Custom Commands

#Create research directory and send any messages to /dev/null
mkdir ~/research 2> /dev/null
#Overwritte existing output file and add a title
echo "A Quick System Audit Script" >  ~/research/sys_info.txt
#Print the current system date
date >> ~/research/sys_info.txt
echo "" >> ~/research/sys_info.txt
#Print the machine type information using the system variable
echo "Machine Type Info:" >> ~/research/sys_info.txt
echo $MACHTYPE >> ~/research/sys_info.txt
#Print the machine information using uname command
echo -e "Uname info: $(uname -a) \n" >> ~/research/sys_info.txt
#Print the ip information by manipulating the result from the ip addr command
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> ~/research/sys_info.txt
#Print the hostname using the hostname command
echo "Hostname: $(hostname -s) " >> ~/research/sys_info.txt
#Gather the list of all executable files the user has access in the system
echo -e "\nExecutable Files:" >>  ~/research/sys_info.txt
find / -type f \( -perm -u=x -o -perm -g=x -o -perm -o=x \) >> ~/research/sys_info.txt
#Print the top 10 processes currently running.
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m | head -11 | awk {'print $1, $2, $3, $4, $11'}  >> ~/research/sys_info.txt


