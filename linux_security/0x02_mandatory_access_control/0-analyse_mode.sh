#!/bin/bash
sestatus | grep "SELinux status" | awk '{print $3}'
