#!/bin/bash
comm -12 <(tail -n 1000 auth.log | grep "Failed password" | sed -n 's/.*from \([0-9.]*\).*/\1/p' | sort -u) <(tail -n 1000 auth.log | grep "Accepted password" | sed -n 's/.*from \([0-9.]*\).*/\1/p' | sort -u) | wc -l
