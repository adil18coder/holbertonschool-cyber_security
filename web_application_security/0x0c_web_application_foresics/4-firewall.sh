#!/bin/bash
# auth.log faylında firewall qaydalarının əlavə edilməsi sayını tapır
grep "ufw" auth.log | grep "BLOCK" | wc -l
