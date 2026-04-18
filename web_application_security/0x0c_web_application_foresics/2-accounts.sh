#!/bin/bash
# auth.log faylının son 1000 sətrində ən çox uğursuz giriş cəhdi olan istifadəçini tapır
tail -n 1000 auth.log | grep "Failed password" | awk '{for(i=1;i<=NF;i++) if($i=="for") print $(i+1)}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
