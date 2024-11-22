#!/bin/bash

#Activity 3 - Service Users

#Check for ftp and dove users in the system
grep "ftp\|dove" /etc/passwd
#Remove the users from the system
sudo deluser --remove-all-files dovecot
sudo deluser --remove-all-files ftp
#Create new tripwire user thhat will be dedicated to run Tripwire app.
sudo adduser --system --no-create-home tripwire
#Verify user hhas a UID of less than a 1000
id tripwire
printf "Verify user Tripwire has a UID of less than a 1000, press any key to continue \n"
#Verify there is no trpwire home directory since it was created as a system user
ls /home
printf "Verify there is no home directory for tripwire user, press any key to continue \n"
sudo tail /etc/shadow
printf "Check to see if tripwire user password is set to *, press any key to continue \n"
sudo tail /etc/passwd
printf "Verify user tripwire is set to usr/sbin/nologin at the end of the line , press any key to continue \n"
