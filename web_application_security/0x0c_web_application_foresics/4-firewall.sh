#!/bin/bash
grep -E "iptables .* -A |ufw allow|firewall-cmd .*--add" auth.log | wc -l
