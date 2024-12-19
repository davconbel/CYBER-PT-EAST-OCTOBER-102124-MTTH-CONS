# Activity 3 Enumeration with traceroute

#List of IP's
$ipAddresses = @(
    "192.0.43.10",
    "107.191.96.26",
    "41.19.96.234",
    "107.191.101.180",
    "23.226.229.4",
    "154.226.18.4",
    "176.56.238.3",
    "176.56.238.99"
)
# Loop through each IP and perform a trace
foreach ($ip in $ipAddresses) {
	#Trace command using Test-NetConnection
    Test-NetConnection -ComputerName $ip -TraceRoute
}