#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo"
  exit 1
fi

# Check if a subnet argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <subnet>"
  echo "Example: $0 192.168.65.0/24"
  exit 1
fi

# Run Nmap ARP scan for live host discovery (no port scan)
nmap -sn -PR "$1"
