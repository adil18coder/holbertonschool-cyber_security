#!/bin/bash

log_file="logs.txt"

if [ ! -f "$log_file" ]; then
    echo "Log file not found!"
    exit 1
fi

attacker_ip=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')

grep "$attacker_ip" "$log_file" | awk -F'"' '{print $6}' | sort | uniq -c | sort -nr | head -1 | awk '{$1=""; print $0}' | sed 's/^ //'
