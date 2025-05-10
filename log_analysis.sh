#!/bin/bash

LOG_FILE="access.log"

echo "1. Total Requests:"
wc -l < "$LOG_FILE"

echo "2. GET Requests:"
grep -c 'GET' "$LOG_FILE"

echo "3. POST Requests:"
grep -c 'POST' "$LOG_FILE"

echo "4. Unique IPs:"
awk '{print $1}' "$LOG_FILE" | sort | uniq | wc -l

echo "5. GET/POST by IP:"
awk '$6 ~ /GET|POST/ {print $1, $6}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo "6. Failed Requests (4xx/5xx):"
FAILS=$(awk '$9 ~ /^[45]/' "$LOG_FILE" | wc -l)
TOTAL=$(wc -l < "$LOG_FILE")
PERCENT=$((FAILS * 100 / TOTAL))
echo "Failures: $FAILS"
echo "Failure Rate: $PERCENT%"

echo "7. Most Active IP:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -1

echo "8. Daily Request Average:"
awk -F'[:[]' '{print $2}' "$LOG_FILE" | cut -d/ -f1,2,3 | sort | uniq -c | awk '{total+=$1; count++} END {print total/count}'

echo "9. Days with Most Failures:"
awk '$9 ~ /^[45]/ {split($4, a, ":"); split(a[1], d, "/"); print d[1] "/" d[2] "/" d[3]}' "$LOG_FILE" | sort | uniq -c | sort -nr | head

echo "10. Requests Per Hour:"
awk -F'[:[]' '{print $2":"$3}' "$LOG_FILE" | cut -d: -f1-2 | sort | uniq -c

echo "11. Status Code Breakdown:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr

echo "12. Most Active IP for GET:"
grep 'GET' "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head -1

echo "13. Most Active IP for POST:"
grep 'POST' "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head -1

echo "14. Failure Patterns by Hour:"
awk '$9 ~ /^[45]/ {split($4, a, ":"); print a[2]}' "$LOG_FILE" | sort | uniq -c | sort -nr
