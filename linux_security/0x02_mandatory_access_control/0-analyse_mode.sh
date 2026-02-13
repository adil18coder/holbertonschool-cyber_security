#!/bin/bash

# SELinux statusunu yoxlayır və cari rejimi çap edir
selinux_status=$(sestatus | grep "SELinux status" | awk '{print $3}')

if [ "$selinux_status" == "enabled" ]; then
    # Əgər SELinux aktivdirsə, cari rejimi əldə edirik
    selinux_mode=$(sestatus | grep "Current mode" | awk '{print $3}')
    echo "SELinux status: aktivdir"
    echo "SELinux cari rejimi: $selinux_mode"
else
    echo "SELinux status: deaktivdir"
fi
