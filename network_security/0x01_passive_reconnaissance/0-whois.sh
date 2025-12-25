#!/bin/bash
whois "$1" | awk '...' > "$1.csv"
