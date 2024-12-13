#!/bin/bash

#Linux Scavenger hunt flag3 

#At this point you should be log as user mitnick. Switch to home dir of user
cd ~
#Find all log files with the mitnick name case insensitive
find / -type f -iname "*mitnick*.log"
#File /var/log/mitnick.log should be found by the previous command
#Now lets get the count of uniq ip's using a compound command.
awk '{print $1}' /var/log/mitnick.log | sort | uniq | wc -l
#The result of uniq ip's is 102
#Lets make a temp directory to work with the files
#Now lets find the zip file
find ~ -name "*.zip"
#File /home/mitnick/Documents/.secret.zip should be found
#Lets create a temp directory to work on the file
mkdir hack
cd hack
cp ~/Documents/.secret.zip ~/hack/secret.zip
echo "When prompt for password entered: 102"
unzip secret.zip
#Now lets display the file containing the found user and password set
cat babbage
echo "lets switch no new user found using password freedom"
echo "Entered password freedom when prompt"
su babbage
