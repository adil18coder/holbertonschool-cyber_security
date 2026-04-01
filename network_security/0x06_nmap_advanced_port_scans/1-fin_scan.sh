#!/bin/bash
sudo nmap -sF -T2 -p 80-85 "$1"
