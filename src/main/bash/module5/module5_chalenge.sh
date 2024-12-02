#!/bin/bash                                                                                                                                     
                                                                                                                                                
cd ~/Projects                                                                                                                                   
#Extract contents of tar file                                                                                                                   
tar -xvvf TarDocs.tar                                                                                                                           
#list files after they are extracted                                                                                                            
ls -l                                                                                                                                           
#Create tar file containing only the Documents directory and exclude the Java subdirectory.                                                     
tar --exclude='TarDocs/Documents/Java' -cvvf Javaless_Docs.tar TarDocs/Documents                                                                
#List files and ensure Java subdirectory does not exist                                                                                         
tar tvvf Javaless_Docs.tar | grep Java                                                                                                          
                                                                                                                                                
#Entrie for the cron job for part 2 of the chalenge                                                                                             
#0 6 * * 4 sudo tar -czf /auth_backup.tgz /var/log/auth.log                                                                                     
#Part 3 of the chalenge                                                                                                                         
#  a) Use brace expansion to create subdirectories                                                                                              
mkdir -p ~/backups/{freemem,diskuse,openlist,freedisk}                                                                                          
                                                                                                                                                
# Save the amount of free memory to a file                                                                                                      
free -h > ~/backups/freemem/free_mem.txt                                                                                                        
echo "Free memory saved to ~/backups/freemem/free_mem.txt"                                                                                      

# Save disk usage to a file
du -h > ~/backups/diskuse/disk_usage.txt
echo "Disk usage saved to ~/backups/diskuse/disk_usage.txt"

# Save the list of open files to a file
lsof > ~/backups/openlist/open_list.txt
echo "Open files saved to ~/backups/openlist/open_list.txt"

# Save file system disk space statistics to a file
df -h > ~/backups/freedisk/free_disk.txt
echo "File system disk space statistics saved to ~/backups/freedisk/free_disk.txt"
