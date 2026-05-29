#!/bin/bash

echo -e "\n===== TASK 3 =====\n"

echo 'sudo groupadd special_pass'
echo 'sudo useradd dev1'
echo 'sudo useradd dev2'
echo 'sudo usermod -aG special_pass dev1'
echo 'sudo usermod -aG special_pass dev2'

echo -e "\nPassword policy\n"
echo 'sudo nano /etc/security/pwquality.conf'
echo 'minlen = 8'

echo -e "\nPassword expiration\n"
echo 'chage -M 15'

echo -e "\nOR\n"
echo 'sudo nano /etc/login.defs'
echo 'PASS_MAX_DAYS 15'

echo -e "\nInactive password lock\n"
echo 'sudo chage -I 5'

echo -e "\nForce password change at next login\n"
echo 'sudo chage -d 0'

echo -e "\nVerify group membership\n"
echo 'cat /etc/group | grep special_pass'
echo 'getent group special_pass'

echo -e "\nRemove users\n"
echo 'sudo userdel dev1'
echo 'sudo userdel dev2'

echo -e "\n===== FSTAB =====\n"
echo 'cat /etc/fstab'

echo -e "\n===== END OF TASK =====\n"
