#!/bin/bash
echo -e "\n===== LAB 3.2 =====\n"

echo -e "1. Local DNS Resolution\n"
echo '/etc/hosts'
echo '35.223.222.126 myapp.local'
echo 'ping myapp.local'

echo -e "\n2. SSH Local Port Forwarding\n"
echo 'On GCP VM:'
echo 'python3 -m http.server 9000 --bind 127.0.0.1'

echo -e "\nOn local machine:"
echo 'ssh -L 8080:127.0.0.1:9000 ksan@35.223.222.126'

echo -e "\nOpen in browser:"
echo 'http://localhost:8080'

echo -e "\n3. Self-Signed SSL Certificate\n"
echo 'sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt'

echo -e "\nConfigure nginx:"
echo 'sudo nano /etc/nginx/sites-available/default'

echo 'server {'
echo '    listen 443 ssl;'
echo '    server_name _;'
echo '    ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;'
echo '    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;'
echo '    location / {'
echo '        root /var/www/html;'
echo '        index index.html index.htm;'
echo '    }'
echo '}'

echo -e "\nPrepare test page:"
echo 'sudo cp /var/www/html/index.nginx-debian.html /var/www/html/index.html'

echo -e "\nRestart nginx:"
echo 'sudo systemctl restart nginx'

echo -e "\nTest HTTPS:"
echo 'https://35.223.222.126'

echo -e "\n4. Network Capture\n"
echo 'sudo tcpdump -i any port 80 -w /tmp/http_traffic.pcap'

echo -e "\n5. Network Segmentation\n"
echo 'App Servers: 10.0.0.0/24'
echo 'Hosts: 10.0.0.1 - 10.0.0.254'
echo 'Broadcast: 10.0.0.255'

echo ''
echo 'DMZ: 10.0.1.0/26'
echo 'Hosts: 10.0.1.1 - 10.0.1.62'
echo 'Broadcast: 10.0.1.63'

echo ''
echo 'Management: 10.0.1.64/27'
echo 'Hosts: 10.0.1.65 - 10.0.1.94'
echo 'Broadcast: 10.0.1.95'

echo ''
echo 'DBs: 10.0.1.96/28'
echo 'Hosts: 10.0.1.97 - 10.0.1.110'
echo 'Broadcast: 10.0.1.111'

echo -e "\n6. Simple Repository\n"
echo 'cd /opt/lab3-repo/'
echo 'echo "hello-anyops" | sudo tee any-ops.rpm'
echo 'sudo dpkg-scanpackages . /dev/null > Packages'

echo -e "\nNginx configuration:"
echo 'listen 80;'
echo 'root /opt/lab3-repo;'

echo -e "\n7. Network Utilities\n"
echo 'ethtool'
echo 'netplan apply'
echo 'nmcli'

echo -e "\n8. Background SSH Tunnel\n"
echo 'ssh -FnL LOCAL_PORT:REMOTE_HOST:REMOTE_PORT USER@SERVER'

echo -e "\n9. Git Topics\n"
echo 'Remove .env from history'
echo 'Git stages'
echo 'git rebase'
echo 'git reset'
echo 'git restore'

echo -e "\n===== END OF LAB 3.2 =====\n"
