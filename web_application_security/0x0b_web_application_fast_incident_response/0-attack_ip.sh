#!/bin/bash

log_file="logs.txt"

if [ ! -f "$log_file" ]; then
    echo "Log file not found!"
    exit 1
fi

# IP-ləri çıxar, say, ən çox olanı tap
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
