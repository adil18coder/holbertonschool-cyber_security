#!/bin/bash
nmap -sM -v -p http,https,ftp,ssh,telnet "$1"
