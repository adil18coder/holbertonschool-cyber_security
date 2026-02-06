#!/bin/bash
/usr/sbin/john --format=Raw-MD5 --wordlist=/usr/share/wordlists/rockyou.txt "$1" && /usr/sbin/john --show --format=Raw-MD5 "$1" | awk -F: '{print $2}' > 4-password.txt
