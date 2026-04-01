#!/bin/bash
sudo nmap -vv -sM -p http,https,ftp,ssh,telnet "$1"
