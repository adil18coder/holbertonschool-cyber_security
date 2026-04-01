#!/bin/bash
nmap -sW -p "$2" --exclude-ports "$3" "$1"
