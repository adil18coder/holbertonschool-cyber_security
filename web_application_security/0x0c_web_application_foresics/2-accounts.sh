#!/bin/bash
# Loq faylını analiz edir və ən çox uğursuz giriş cəhdi olan istifadəçini tapır
tail -n 1000 auth.log | grep "Failed password" | awk '{print $(NF-5)}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
