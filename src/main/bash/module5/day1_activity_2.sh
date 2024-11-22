#!/bin/bash

#Activity 2 - Restoring Data with Incremental Backups

cd ~/Documents/epscript/testenvir
ls -l
cd ..
#Create the level 0 backup for the testenvir directory
tar cvvWf epscript_back_sun.tar --listed-incremental=epscript_backup.snar --level=0 testenvir
printf "Check previous output and press any key to continue \n"
#We are goint to delete the patient directory and recreated from the tar file
rm -r testenvir/patient
ls -l tar xvvf epscript_back_sun.tar -R -C ~/Documents/epscript/ testenvir/patient/
cd ~/Documents/epscript
#Extract the patient directory this will recreaate the directory previously deleted.
tar xvvf epscript_back_sun.tar -R -C ~/Documents/epscript/ testenvir/patient/
ls -l testenvir/.
#Create some new files in the patient directory
cd ~/Documents/epscript/testenvir/patient/ 
touch patient.0a.txt patient.0b.txt
ls -l
cd ~/Documents/epscript
#Create new incremental file
tar cvvWf epscript_back_mon.tar --listed-incremental=epscript_backup.snar testenvir
#Run to verify new files have been added
tar tvvf epscript_back_mon.tar --incremental | cat

#Done