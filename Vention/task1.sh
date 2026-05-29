#!/bin/bash
set -eu
cd /Users/ksan/Desktop/Vention
echo -e "1. Find the top 20 IP addresses by number of requests\n"
cat access.log | awk '{print $1}' | sort | uniq -c | sort -rnk1 | head -n 20
echo -e "\n 2. Find all unique URLs that returned HTTP 500 errors\n"
cat access.log | awk '$9 == 500 {print $11}' | sort | uniq | head -n 20
echo -e "\n 3. Count the number of requests per hour for the last 24 hours\n"
cat access.log | awk -F '[' '{print $2}' | awk -F '/' '$1 > 22 {print $0}' | sort -rn | awk -F ':' '{print $1, $2}' | awk '{if (($1 == "23/Apr/2026" && $2 >= 22) || ($1 == "24/Apr/2026" && $2 <= 22)) print $0}' | uniq -c | awk 'BEGIN {print "TOTAL_COUNT DATE HOUR"} {print $0}' | column -t
echo -e "\n 4. Find the 10 largest POST requests by body size\n"
cat access.log | awk '/POST/{print $0}' | sort -rnk10 | head -n 10
echo -e "\n 5. Extract all requests from IP range 192.168.1.0/24 to a file\n"
cat access.log | awk '/^192.168.1./{print $0}' > extract.txt
echo -e "\n Extracter to file extract.txt in the same directory\n Here some of its output"
cat extract.txt | head -n 10
echo -e "\n END OF TASK\n"