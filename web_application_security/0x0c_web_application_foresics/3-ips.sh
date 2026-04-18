#!/bin/bash
# auth.log faylındakı bütün 'Accepted' sətirlərindən unikal IP-ləri tapır və sayır
grep "Accepted" auth.log | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -u | wc -l
