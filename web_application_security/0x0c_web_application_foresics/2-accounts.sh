#!/bin/bash
tail -n 1000 auth.log | grep "Failed password" | awk '{print $9}' | sort | uniq > f; tail -n 1000 auth.log | grep "Accepted password" | awk '{print $9}' | sort | uniq > s; comm -12 f s | head -n 2
