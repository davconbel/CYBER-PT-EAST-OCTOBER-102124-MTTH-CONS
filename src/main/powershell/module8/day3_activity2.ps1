# Activity 2 Network Addressing
#Script provided by instructor in class.
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
# Loop through each IP and perform a ping
foreach ($ip in $ipAddresses) {
    Write-Host "Pinging $ip..." -ForegroundColor Cyan
    $pingResult = Test-Connection -ComputerName $ip -Count 4 -Quiet
    if ($pingResult) {
        Write-Host "Ping to $ip succeeded!" -ForegroundColor Green
    } else {
        Write-Host "Ping to $ip failed!" -ForegroundColor Red
    }
    Write-Host "---------------------------"
    }