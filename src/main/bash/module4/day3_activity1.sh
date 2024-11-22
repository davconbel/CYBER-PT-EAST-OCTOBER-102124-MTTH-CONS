#!/bin/bash

#Activity 1 - Permissions Bonus only

#Let's go to the research directory
cd ~/research/
#Create a file to document users with no password and users with UID of 0
rm -f permissions.txt
echo "##################Users with no password set ##############################" > permissions.txt 
#Lets grep for users with no password set
sudo grep "!" /etc/shadow >> >> permissions.txt
#Now for users with UID of 0
echo "##################Users with UID of 0 ##############################" >> permissions.txt 
grep "x:0" /etc/passwd >> permissions.txt

