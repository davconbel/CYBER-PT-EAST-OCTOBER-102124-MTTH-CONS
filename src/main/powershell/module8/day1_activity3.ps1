# Activity 3 Network Addressing
#Script to convert binary to ip

#List of binary ip's to convert
$binEntries = @(
    "11000000101010000100010110010001",
    "00001010000000000000000000101010",
    "11000000101011000100010110010001",
    "00101001001011011011011000100000",
    "00001010000000000000000001001100"
 )
# Loop through each binary IP
foreach ($ip in $binEntries) {
	#Use regex to split the string every 8 characters
    $chunks = [regex]::matches($ip, '.{1,8}')
    #Prepare output string
    $ipout =""
    #Iterate through each chunk
    foreach($chunk in $chunks)
        {
		 #Convert binary chunk to a number and add to the output string           
            $ipout = $ipout + [convert]::ToInt64($chunk.Value,2) + "."
         }
         #Write final ip
         $ipout
}

Write-Host "Script Completed!"