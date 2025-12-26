#!/bin/bash
whois "$1" | awk '/Registrant|Admin|Tech/{s=$1}/:/{sub(/^[^:]*: /,"");print s" "$2","$0}' > "$1.csv"
