#!/bin/bash

#Linux Scavenger hunt flag1 and 2

#Ensure you have follow the instructions to start and login in the scavenger-hunt environment.
#Flag 1
# Search all files  in the user home directory and grep for flag_1
cd ~
grep -rnw . -e "flag_1"
# Search for all text files with or with out txt extension
find . -type f -exec file --mime {} + | grep "text" | cut -d: -f1
#Found shadow file in ~/Documents/my-files/shadow
#Grep the file for user mitnick and output the line to a new file
grep mitnick ~/Documents/my-files/shadow > ~/crack.txt
#Run john the ripper to crack mitnick password
john crack.txt
#Lets sleep for 50 seconds to let john crack the password
for i in {1..10}
do
   echo "Processing ..."
   sleep 5
done
john -show crack.txt
echo when prompted entered password: trustno1
su mitnick