#!/bin/bash
# auth.log faylında firewall qaydalarının əlavə edilməsi (iptables) sayını tapır
grep "iptables" auth.log | wc -l
