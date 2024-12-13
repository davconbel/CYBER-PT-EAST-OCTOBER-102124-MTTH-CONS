#/bin/bash
##Linux Scavenger hunt flag5
#Find the script that needs fixing
find . -name '*.sh'
#The file found is ~/Documents/flag5.sh
#The file has an extra do im the for loop and a missing then in the if statement
#The lines below has the fix code. 
width=72
for i in ${0};
do
    lines="$(wc -l < $1 | sed 's/ //g')"
    chars="$(wc -c < $1 | sed 's/ //g')"
    owner="$(ls -ld $1 | awk '{print $3}')"
    echo "-----------------------------------------------------------------"
    echo "File $1 ($lines lines, $chars characters, owned by $owner):"
    echo -e "-----------------------------------------------------------------\n"
    file=$(cat /var/tmp/5galf)
        if [ ${#file} -gt $width ]; then
        echo "$file" | fmt | sed -e '$s/^/  /' -e '2,$s/^/+ /'
        else
        echo "  $file"
        fi

    echo "-----------------------------------------------------------------"
done
echo "Enterd password: passw0rd"
su sysadmin