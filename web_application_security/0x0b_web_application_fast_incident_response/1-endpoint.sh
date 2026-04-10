#!/bin/bash

log_file="logs.txt"

if [ ! -f "$log_file" ]; then
    echo "Log file not found!"
    exit 1
fi

awk -F'"' '{print $2}' "$log_file" | awk '{print $2}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
