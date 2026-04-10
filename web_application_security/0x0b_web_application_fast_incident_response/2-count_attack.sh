#!/bin/bash

log_file="logs.txt"

if [ ! -f "$log_file" ]; then
    echo "Log file not found!"
    exit 1
fi

awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -1 | awk '{print $1}'
