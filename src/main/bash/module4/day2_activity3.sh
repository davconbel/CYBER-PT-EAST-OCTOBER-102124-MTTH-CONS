#!/bin/bash

#Activity 3 - Users and Groups 

#Display UID and GID of the current user
id
# Switch to the research directory
cd ~/research
#Delete files if exist to ensure latest user information
rm -f user_ids.txt group_ids.txt
touch user_ids.txt group_ids.txt

#From the /etc/passwd file get all the users in the system contained in the first column
# and get the id and group info for each of them.
for user in $(cut -d: -f1 /etc/passwd); do
    echo "$user: $(id $user)" >> user_ids.txt
    echo "$user: $(groups $user)" >> group_ids.txt    
done
#Remove user jack from the sudo group
sudo usermod -G jack jack
#Remove user jack and home directory from the system.
sudo deluser --remove-home jack
#Create group developers
sudo addgroup developers
#Add users to the developers group
sudo usermod -G developers adam
sudo usermod -G developers billy
#Remove unwanted group
sudo delgroup hax0rs



