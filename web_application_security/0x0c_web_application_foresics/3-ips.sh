#!/bin/bash
# Uğurlu giriş etmiş unikal IP-lərin sayını hesablayır
grep "Accepted" auth.log | awk '{for(i=1;i<=NF;i++) if($i=="from") print $(i+1)}' | sort | uniq | wc -l
