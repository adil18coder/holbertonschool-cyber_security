#!/bin/bash
# auth.log faylındakı bütün uğurlu girişlərin unikal IP sayını tapır
grep "Accepted" auth.log | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -u | wc -l
