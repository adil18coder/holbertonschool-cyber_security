#!/bin/bash
grep -Ei "add.*rule|iptables.*-A|ufw allow|--add-port" auth.log | wc -l
