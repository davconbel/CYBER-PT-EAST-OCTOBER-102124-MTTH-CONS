#!/bin/bash
#Activity 3: Sysadmin Bash Script
# 1 Create a new script file called sys_info.sh in the user home directory
# cd ~
touch sys_info.sh
# 2 Change the permissions on the file to make it executable
chmod +x sys_info.sh
# 3 Add a top hashbang line to make this a Bash script.
echo "#!/bin/bash" >> sys_info.sh
# 4 A title and today's date
echo "echo Usefull system information gather on " >> sys_info.sh
echo date >> sys_info.sh
# 5 The uname info for the machine
echo 'echo -e "Uname info: $(uname -a) \n"' >> sys_info.sh
# 6 The machine's eth0 IP address (Narrow this output down to one line.)
echo 'echo -e "IP Info: $(ip addr show eth 0| head -n 3 | tail -n 1) \n"' >> sys_info.sh
# 7 The hostname
echo 'echo "Hostname: $(hostname -s)"' >> sys_info.sh
# 8 Run the script
~/sys_info.sh
#------------------------Bonus--------------------------------

# The DNS info
echo 'echo "DNS Servers: "' >> sys_info.sh
echo "cat /etc/resolv.conf" >> sys_info.sh
# The Memory info
echo 'echo "Memory Info:"' >> sys_info.sh
echo "free" >> sys_info.sh
# The CPU info
echo 'echo -e "\nCPU Info:"' >> sys_info.sh
echo "lscpu | grep CPU" >> sys_info.sh
# The Disk usage
echo 'echo -e "\nDisk Usage:"' >> sys_info.sh
echo "df -H | head -2" >> sys_info.sh
# The currently logged-on users
echo 'echo -e "\nWho is logged in: \n $(who -a) \n"' >> sys_info.sh
#Run the script with the additional information
~/sys_info.sh
