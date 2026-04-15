#!/bin/bash
# auth.log faylını oxuyuruq (və ya sənə verilən loq faylını)
# 5-ci sütun adətən "sshd[1234]:" formatında olur

cat auth.log | awk '{print $5}' | cut -d'[' -f1 | cut -d':' -f1 | sort | uniq -c | sort -nr
