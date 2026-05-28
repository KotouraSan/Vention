```bash
#!/bin/bash

set -eu

echo -e "1. Command to find all files larger than 100MB in home directory\n"
echo 'find ~/ -type f -size +100M'

echo -e "\n2. Command to find files in /etc modified within the last 1 day\n"
echo 'find /etc -type f -mtime -1'

echo -e "\n3. Command to find and interactively remove .tmp files older than 7 days in /var\n"
echo 'find /var -name "*.tmp" -mtime +7 -exec rm -i {} \;'

echo -e "\n4. Commands to create myapp directory structure and set permissions\n"
echo 'cd ~/opt && mkdir -p myapp/{bin,config,logs,data,backups}'
echo 'chmod 755 ~/opt/myapp/bin'
echo 'chmod 640 ~/opt/myapp/config'
echo 'chmod 770 ~/opt/myapp/logs'
echo 'chmod 750 ~/opt/myapp/data'

echo -e "\n5. Command to create symbolic link for myapp binary\n"
echo 'ln -sf /opt/myapp/bin/myapp /usr/local/bin/myapp'

echo -e "\n6. Command to create compressed archive of myapp directory\n"
echo 'tar -zcvf myapp.tar.gz -C /opt/myapp .'

echo -e "\nEND OF TASK\n"
```
