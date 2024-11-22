#!/bin/bash

#Activity 1 - Restoring Backups with tar

cd ~/Documents/epscript/backup
ls -l
#File Name user input
read -p "Enter complete tar file name: " fileName
#Preview file contents
tar tvvf $fileName | cat
mkdir patient_search
#Extract patient contents from the tar file.
tar xvvf $fileName -C patient_search/ epscript/patients
#View list of extracted files
ls -l patient_search/epscript/patients
#Move back to parent directory and search for the 2 patients.
cd ~/Documents/epscript/
grep -R "Mark,Lopez" .
grep -R "Megan,Patel" .