#!/bin/bash
nmap -p 21,22,80,443,9929,31337 --script http-vuln-cve2017-5638,ssl-enum-ciphers,ftp-anon "$1" -oN comprehensive_scan_results.txt
