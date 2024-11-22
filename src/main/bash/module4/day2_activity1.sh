#!/bin/bash

#Activity 1 - Let's Talk to John 

cd /home/sysadmin
#Make a copy of the shadow file in our home directory
sudo cp /etc/shadow shadow_copy
#grep for the names giving in the activity and output to a new file.
grep -E "jack|adam|billy|sally|max" shadow_copy > shadow_list
john -show shadow_list > shadow_cracked

