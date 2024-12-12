#!/bin/bash
# Activity 2: Creating Aliases
#******When running this command ensure you give it execute permissions
#*****and execute using . ./shell_name
#****this will prevent the script to run on a separate shell 
#*****this is needed for the source command to take effectvi test	
# Make a copy of your original .bashrc file
cp ~/.bashrc ~/.bashrc.orig
# Lets check the current alias in the system
# Add the first alias to the bottom of the file ensure to use >>
# Add alias for ls -a
echo "alias lsa='ls -a'" >> ~/.bashrc
# Add alias to go to change directory to ~/Documents, ~/Downloads, and /etc
echo "alias docs='cd ~/Documents'" >> ~/.bashrc
echo "alias dwn='cd ~/Downloads'" >> ~/.bashrc
echo "alias etc='cd /etc'" >> ~/.bashrc
# Verify the last entries of the bashrc file and ensure it has your entries.
tail -4 ~/.bashrc
# Lets source the file to make it active
source ~/.bashrc
alias
