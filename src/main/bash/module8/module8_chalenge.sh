#!/bin/bash

ip_addresses=(
   "12.205.151.91"
   "15.199.151.91"
   "15.199.158.91"
   "15.199.141.91"
   "15.199.131.91"
   "15.199.121.91"
   "15.199.111.91"
   "15.199.100.91"
   "15.199.99.91"
   "15.199.98.91"
   "15.199.97.91"
   "15.199.96.91"
   "15.199.95.91"
   "15.199.94.91"
   "203.0.113.32"
   "161.35.96.20"
   "192.0.2.0"
   "192.0.2.16"
   "198.51.100.0"
   "198.51.100.16"
   "198.51.100.32"
   "203.0.113.0"
   "203.0.113.16"
)
# Loop through each IP and perform a ping

for ip in "${ip_addresses[@]}"; do

    echo -e "\033[36mPinging $ip...\033[0m"

    ping_result=$(ping -c 4 -W 1 "$ip" > /dev/null 2>&1; echo $?)

    if [ $ping_result -eq 0 ]; then

        echo -e "\033[32mPing to $ip succeeded!\033[0m"
        nmap -sS $ip

    else

        echo -e "\033[31mPing to $ip failed!\033[0m"

    fi

    echo "---------------------------"

done
                                              