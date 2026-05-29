#!/bin/bash

set -eu

echo -e "===== LAB 2.1 =====\n"

echo -e "1. Users and Groups\n"
echo 'sudo groupadd ops'
echo 'sudo groupadd developer'
echo 'sudo useradd dev1'
echo 'sudo useradd dev2'
echo 'sudo usermod -aG developer dev1'
echo 'sudo usermod -aG developer dev2'
echo 'sudo usermod -aG ops deployer'

echo -e "\n1.2 Sudo permissions\n"
echo 'sudo visudo -f /etc/sudoers.d/deployer'
echo 'deployer ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart *'

echo -e "\n2. SSH Hardening\n"
echo 'sudo nano /etc/ssh/sshd_config'
echo 'PermitRootLogin no'
echo 'PasswordAuthentication no'
echo 'PubkeyAuthentication yes'

echo -e "\n3. UFW Firewall\n"
echo 'sudo ufw allow 22/tcp'
echo 'sudo ufw allow 80/tcp'
echo 'sudo ufw allow 443/tcp'
echo 'sudo ufw enable'

echo -e "\n4. Sysctl Configuration\n"
echo 'sysctl -a'
echo 'sudo nano /etc/sysctl.d/lab2-custom.conf'
echo 'net.ipv4.ip_forward = 1'
echo 'vm.swappiness = 10'
echo 'net.core.somaxconn = 65535'
echo 'sudo sysctl --system'

echo -e "\n5. Logrotate Configuration\n"
echo 'cd /etc/logrotate.d/'
echo 'nano app_logs.conf'
echo '/opt/app/logs/*.log {'
echo '    weekly'
echo '    rotate 4'
echo '    compress'
echo '    delaycompress'
echo '}'

echo -e "\n===== LAB 2.2 =====\n"

echo -e "1. Health Check Script\n"
echo 'cd /opt/healthcheck/'
echo 'nano check.sh'
echo 'echo -e "\n Total Disk usage\n"'
echo "df -h | awk '{print \$1, \$2, \$4}' | column -t"
echo 'echo -e "\n\n"'
echo "sudo du -ah --max-depth=1 / 2>&1 | sort -hr | awk '!/du: cannot/{print \$0}'"
echo 'echo -e "\n Total Memory usage\n"'
echo "sudo free -h | awk '{print \$1, \$2, \$3}' | column -t"

echo -e "\n2. Systemd Service\n"
echo 'sudo nano /etc/systemd/system/healthcheck.service'
echo '[Unit]'
echo 'Description=HealthCheck Service shows du df free'
echo '[Service]'
echo 'Type=oneshot'
echo 'ExecStart=/opt/healthcheck/check.sh'
echo 'User=root'

echo -e "\n3. Systemd Timer\n"
echo 'sudo nano /etc/systemd/system/healthcheck.timer'
echo '[Unit]'
echo 'Description=Run HealthCheck every 5 min'
echo '[Timer]'
echo 'OnCalendar=*:0/5'
echo '[Install]'
echo 'WantedBy=timers.target'

echo -e "\n4. Timer Activation\n"
echo 'sudo systemctl daemon-reload'
echo 'sudo systemctl enable --now healthcheck.timer'
echo 'systemctl status healthcheck.timer'
echo 'sudo journalctl -u healthcheck.service'

echo -e "\n5. LVM Setup\n"
echo 'sudo pvcreate /dev/sdb'
echo 'sudo vgcreate data-vg /dev/sdb'
echo 'sudo lvcreate -L 6G -n app-data data-vg'
echo 'sudo lvcreate -L 4G -n app-logs data-vg'
echo 'sudo mkfs.ext4 /dev/data-vg/app-data'
echo 'sudo mkfs.xfs /dev/data-vg/app-logs'
echo 'sudo mkdir -p /mnt/app/data'
echo 'sudo mkdir -p /mnt/app/logs'
echo 'sudo mount /dev/data-vg/app-data /mnt/app/data'
echo 'sudo mount /dev/data-vg/app-logs /mnt/app/logs'

echo -e "\n6. LVM Expansion\n"
echo 'sudo pvcreate /dev/sdc'
echo 'sudo vgextend data-vg /dev/sdc'
echo 'sudo lvextend -L +2G /dev/data-vg/app-data -r'

echo -e "\n===== END OF LAB =====\n"