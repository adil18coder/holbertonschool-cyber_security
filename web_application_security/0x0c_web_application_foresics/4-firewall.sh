#!/bin/bash
grep -iE "iptables.* -A |ufw.*allow|firewall.*add|add.*rule" auth.log | wc -l
