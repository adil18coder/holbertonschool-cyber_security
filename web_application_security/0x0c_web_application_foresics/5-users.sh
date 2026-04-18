#!/bin/bash
# auth.log faylında yeni yaradılmış istifadəçiləri tapır, vergüllə düzür və yeni sətir əlavə edir
USERS=$(grep "new user" auth.log | awk -F'[,=]' '{print $2}' | sort -u | tr '\n' ',' | sed 's/,$//')
echo "$USERS"
