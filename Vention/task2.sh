#!/bin/bash

echo -e "\n===== USER MANAGEMENT =====\n"

echo '/etc/passwd'
echo 'mike:x:1200:1200:NewUserMike:/home/mike:/bin/bash'
echo 'user:x:UID:GID:Description:HomeDir:Shell'
echo 'x или "" , после нужно задать пароль самому'

echo -e "\n/etc/group\n"
echo 'finance:x:1201:nancy,randy,donna,mike'

echo -e "\nAccounting directory permissions\n"
echo 'mkdir /home/accounting'
echo 'chgrp finance /home/accounting'
echo 'chmod 2770 /home/accounting'
echo 'setfacl -m u:donna:--- /home/accounting'
echo 'setfacl -m u:mike:--- /home/accounting'

echo -e "\nUser expiration and ACLs\n"
echo 'usermod -e 2026-05-12 mike'
echo 'touch project.test'
echo 'mv project.test /home/mike/'
echo 'setfacl -m u:donna:r-- /home/accounting/project.test'
echo 'chattr +i /home/mike/project.test'
