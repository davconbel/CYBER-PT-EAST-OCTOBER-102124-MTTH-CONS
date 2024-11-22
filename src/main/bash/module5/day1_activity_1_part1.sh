#!/bin/bash

#Activity 1 part1 - Creating Backups with tar

cd ~/Documents/epscript/
ls -l
printf "Check file list and press any key to continue \n"
ls -Rl .
printf "Check file list and press any key to continue \n"
# Get current date in a variable
d=$(date +%Y%m%d)
#Move one directory up to tarball the epscript directory
cd ..
#tar the directory using the date variable captured in the name
tar cvvWf "$d"epscript.tar epscript/ > "$d"epscript.txt 
cat "$d"epscript.txt
echo Verify above output for any errors while creating the tarball file.
cp  "$d"epscript.tar ~/Documents/epscript/backup