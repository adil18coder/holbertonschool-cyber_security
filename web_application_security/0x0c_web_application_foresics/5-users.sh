#!/bin/bash
# auth.log faylında yeni yaradılmış istifadəçiləri tapır və vergüllə düzür
grep "new user" auth.log | awk -F'[,=]' '{print $2}' | sort -u | tr '\n' ',' | sed 's/,$//'
