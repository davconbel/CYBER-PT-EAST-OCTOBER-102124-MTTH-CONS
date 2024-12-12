#!/bin/bash

#Activity 1 - Compound Commands

#  1. Create a research directory and copy all system logs 
# along with the shadow, passwd, and hosts files in one long command.
mkdir -p ~/research && cp -r /var/log/* /etc/passwd /etc/shadow /etc/hosts ~/research
#The -p option will create the directory if it does not exist, but it won't give an error if it does.

# 2. Create a list of all executable files in the home folder and save it to a text file in the 
# research folder with one long command
sudo find / -type f \( -perm -u=x -o -perm -g=x -o -perm -o=x \) > ~/research/exec_lst.txt

# 3. Create a list of the 10 most active processes. The list should only contain USER, PID, %CPU, %MEM, and COMMAND. 
# Save this list to a text file in your research directory with one long command.
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head -n 11 > ~/research/top_processes.txt

#Bonus 
# Create a list of home folders along with user info from the passwd file. Only add the user info to your list 
# if the UID is greater than 1,000
ls /home > ~/research/users.txt && cat /etc/passwd | awk -F ":" '{if ($3 >= 1000) print $0}' >> ~/research/users.txt