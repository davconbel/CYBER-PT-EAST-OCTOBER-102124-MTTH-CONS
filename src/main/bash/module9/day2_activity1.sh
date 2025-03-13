#!/bin/bash

ip_addresses=(
   "splunk.com"
   "fireeye.com"
   "nmap.org"
)
# Loop through each IP and perform a ping

for ip in "${ip_addresses[@]}"; do

    echo -e "\033[36mPinging $ip...\033[0m"
   nslookup -type=NS $ip
   nslookup -type=MX $ip
   nslookup -type=A $ip
   nslookup -type=txt $ip
   echo "---------------------------"

done
