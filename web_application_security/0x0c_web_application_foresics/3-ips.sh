#!/bin/bash
tail -n 1000 auth.log | grep "Accepted" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | sort | uniq | wc -l
