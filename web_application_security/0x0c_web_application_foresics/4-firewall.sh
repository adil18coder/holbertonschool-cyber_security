#!/bin/bash
grep -i "iptables\|ufw\|firewall\|rule" auth.log | wc -l
