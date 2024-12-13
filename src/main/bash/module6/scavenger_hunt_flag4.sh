#!/bin/bash

#Linux Scavenger hunt flag4 

#Lets find files that has read permissions for the owner, no permissions for groups, and executable only for everyone else
# in the user home directory and print its contents
cd ~
for f in $(find . -type f -perm 401)
do
        echo "File name: $f"
        file $f | cat $f
done
echo "Now lets switch to user stallman using computer as a password"
echo "Enter computer when prompted for password"
su stallman
