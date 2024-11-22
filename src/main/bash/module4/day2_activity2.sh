#!/bin/bash

#Activity 2 - sudo Wrestling 
#Display current user
whoami
# Display sudo privileges of current user.
sudo -l
#Delete file if exist to ensure latest users
rm -f sudo_access.txt
touch sudo_access.txt
#From the /etc/passwd file get all the users in the system contained in the first column
#and save the ourput from the sudo -lU command
for user in $(cut -d: -f1 /etc/passwd); do
    echo "$user: $(sudo -lU $user)" >> sudo_access.txt
done

sudo grep less /etc/sudoers


