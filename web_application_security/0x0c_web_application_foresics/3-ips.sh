#!/bin/bash
tail -n 1000 auth.log | grep "Accepted password" | awk '{print $11}' | sort | uniq | wc -l
