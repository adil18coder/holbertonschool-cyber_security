#!/bin/bash
grep -iE "iptables .* -A |ufw allow|--add-port|--add-rule" auth.log | wc -l
